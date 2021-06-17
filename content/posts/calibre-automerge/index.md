---
title: "Contributing to a Calibre Plugin: Adding 'Merge All Groups' Functionality to the Detect Duplicates Plugin"
date: 2021-06-02T02:16:47-08:00
draft: false
categories: ['programming']
tags: ['open-source', 'personal-project', 'python']
---

I'm about to talk a lot, so if you only care about the code, or details on how to edit a Calibre plugin, click [Jump To Technical Bits](#technical-bits)

I use Calibre to manage my ebook library. Calibre is a GPL-3 licensed ([sort of](https://github.com/kovidgoyal/calibre/blob/master/COPYRIGHT))
program chock full of ebook management tasks, such as tagging, converting formats (e.g. Mobi -> Epub), or mass-editing metadata. It also
has a relatively straightforward API for writing plugins.

My ebook library is huge, at nearly 5,000 titles (after de-duping). I'm a data hoarder, and love reading. Before I de-duped that was more like
8,000 titles, and therein lay the problem: as far as I could tell, there was no straightforward way to automatically remove duplicates from
a Calibre library. There *is* a "find-duplicates" plugin, and that's where this journey began.

I used the "find-duplicates" plugin to list out all my duplicates, which ended up being several thousand "groups" of duplicates. It
looks like this:


{{< figure src="duplicate-group-view.png" alt="Screenshot of Calibre view of duplicate titles." caption="Duplicates grouped in Calibre." >}}

Each of those groups can be acted upon, typically by merging. Annoyingly though, though it appears both books are selected, they aren't, so if I try to hit "M" to merge, I get an error about needing more than one book selected. So that means all that "find-duplicates" can really do is put my duplicates in alphabetical order for me. Not exactly useless, but not what I need for my specific usecase.

I slowly was shift-clicking to highlight all books in a group and pressing "M" to merge. Would have taken a while. Perhaps more importantly, I've been stricken by a strong case of general engineer imposter syndrome, that's been growing ever since I left Potato and moved to Taiwan. Some combination of feeling like I snuck into the industry via my bootcamp route, alongside wondering whether I'm even smart enough to engineer at a pace high enough to make me competent. I've been on the hunt to prove myself outside just my frontend world. So as I slowly clicked through my library, I remembered something a CTO had told me in an interview once years ago: "To me, a good engineer is someone who automates anything they do more than twice." I mean I don't necessarily agree that that in particular is what makes a good engineer, but I do agree that if I want to prove to myself that I can hack it, automating a task like this would be a great opportunity to do so. It would involve working from scratch in an unfamiliar library (two, actually), on an open source project, filling a need that surely other people have had.

I decided I was determined to add functionality to merge duplicates, and I'll outline my process below.


# Technical Bits

## Figuring Out What to Do

I knew that the "find-duplicates" plugin had some concept of a "Duplicate Group," and because there were next/previous buttons for hopping between duplicate groups, I figured there was some way to get all book identifiers, whatever they may look like, and then somehow do to those IDs whatever function gets invoked when I hit "M" and try to merge books. First, I needed to find the code.

Unfortunately, I've as of yet to find a public repository for the "find-duplicates" plugin. In fact, I installed it from the Calibre plugin browser directly. I got to googling, and found [this thread](https://www.mobileread.com/forums/showthread.php?t=131017) on the mobileread forums, which appears to be where the plugin was originally posted back in 2011. Luckily, it had the most up to date version of the plugin available as a ZIP, so I downloaded it just to see.

Even luckier: I guess Calibre plugins are just Python apps, and fairly straightforward ones at that. The ZIP had an `__init__.py` at the root, alongside a couple straightforward file names.


{{< figure src="find-duplicates-directories.png" alt="Screenshot of the directory structure of the find-duplicates plugin." caption="Directory structure of find-duplicates" >}}

I poked around a bit just to get a better notion of what was going on, and then pulled my age old super-lazy-frontender-trick: did a project-wide search for a relevant string from a rendered view. In this case, I knew I wanted to do *something* to all duplicate groups, and there was already some action being performed to all duplicate groups by the "find-duplicates" plugin. In the menu for the plugin, there's an option to "Mark All Groups as Exempt." So I just did a project-wide search for that:

{{< figure src="mark-all-text-search.png" alt="Screenshot of the result of a text search for 'mark all groups'." caption="Result of a project-wide text search for 'Mark All Groups'." >}}

(If you're curious, the IDE is Emacs, and the text search function is `helm-project-do-smart-search`. I [blog](https://blog.calebjay.com/tags/emacs/) a bit about my specific environment)

Again pulling from my fronted experience, I guessed that I can probably ignore .po files, as they're usually translation files used to allow for language-picking, evidenced further by them being in a `translations/` directory. Two matches in `action.py` feels good. I pop in and take a look.

`/action.py`
{{< highlight python3 "linenos=table,hl_lines=8-11,linenostart=115" >}}
self.previous_group_action = create_menu_action_unique(self, m, _('&Previous result'), image='images/previous_result.png',
    tooltip=_('Display the previous duplicate result group'),
    triggered=partial(self.show_next_result, forward=False))
    m.addSeparator()
self.mark_group_exempt_action = create_menu_action_unique(self, m, _('&Mark current group as exempt'),
    tooltip=_('Mark the current group as not duplicates and exempt from future consideration'),
    triggered=partial(self.mark_groups_as_duplicate_exemptions, all_groups=False))
self.mark_all_groups_exempt_action = create_menu_action_unique(self, m,
    _('Mark &all groups as exempt'),
    tooltip=_('Mark all remaining duplicate groups as exempt from future consideration'),
    triggered=partial(self.mark_groups_as_duplicate_exemptions, all_groups=True))
{{< / highlight >}}

Based on `create_menu_action`, I'm guessing that this function, and the ones around it (all nearly identical in structure), are responsible for populating the main menu. I don't know anything about `create_menu_action` or how it's invoked, but `triggered=` seems straightforward enough, insomuch as it probably means "invoke this function when clicked." The function in question being `self.mark_groups_as_duplicate_exemptions` . Full text search brings me to that function's definition:

{{< highlight python3 "linenos=table,linenostart=280" >}}
def mark_groups_as_duplicate_exemptions(self, all_groups):
    can_exempt = self.duplicate_finder.check_can_mark_exemption(all_groups)
    if can_exempt:
        # Ensure that the selection is moved onto the current duplicate group
        duplicate_ids = self.duplicate_finder.get_current_duplicate_group_ids()
        self.gui.library_view.select_rows(duplicate_ids)
        exemption_type = 'books'
        if self.duplicate_finder.is_searching_for_authors():
            exemption_type = 'authors'
        dialog_name = 'find_duplicates_mark_all_groups' if all_groups else 'find_duplicates_mark_group'
        if not confirm('<p>' + _(
            'This action will ensure that each of the {0} in the group '
            'are exempt from appearing together again in future.<p>'
            'Are you <b>sure</b> you want to proceed?').format(exemption_type),
            dialog_name, self.gui):
                return
        if all_groups:
            self.duplicate_finder.mark_groups_as_duplicate_exemptions()
        else:
            self.duplicate_finder.mark_current_group_as_duplicate_exemptions()
    else:
        info_dialog(self.gui, _('No duplicates in group'),
            _('There are no duplicates remaining in this group.'),
            show=True, show_copy_button=False)
    self.update_actions_enabled()
{{< / highlight >}}

Out of here, the `duplicate_finder.get_current_duplicate_group_ids()` seems the most useful. I would *expect* that variable, `duplicate_ids`, to then be passed into a function that marks them, which looks to be `self.duplicate_finder.mark_groups_as_duplicate_exemptions` or `self.duplicate_finder.mark_current_group_as_duplicate_exemptions`, but nope, those function calls aren't taking any arguments. So begins a terrifying realization about how things happen in Calibre, when I do a quick search for where `duplicate_ids` is used (oh, it's right there on the next line...): the variable get passed into a `select_rows` function? And the `mark_groups...` functions don't take arguments? So they presumably are working on some form of state set in this function, and that state will likely be... the selection state of the UI?! The method in question is `self.gui.library_view.select_rows(duplicate_ids)`, so it looks like it's some property of the gui, specifically of the library view, and the action performed looks to be selecting rows. Which, I guess, is the same as what I do when I manually shift-click to select a couple "rows" of books. Well, I guess, follow the logic deeper, see what's going on inside of `mark_groups_as_duplicate_exemptions`. Full text search to find where its `def` is hiding. Oh, annoyingly, that's the same name as the function I'm in right now. Luckily, looks like there's another `def` for this function name inside of `duplicates.py`:


`/duplicates.py`

{{< highlight python3 "linenos=table,linenostart=348" >}}
def mark_groups_as_duplicate_exemptions(self):
    '''
    Invoke for all remaining duplicate groups to flag all books they
    contain as not being duplicates of each other within each group.
    Persists these combinations to the config file.
    Clears the search results when done.
    NOTE: This method relies on get_mark_exemption_preview_text() having been
        called first, to ensure the group is valid and in the case of author
        duplicate searches that the authors_for_group_map is populated
    '''
    # Update our duplicates map
    self._mark_group_ids_as_exemptions(list(self._books_for_group_map.keys()))
    # There must be no more duplicate groups so clear the search mode
    self.clear_duplicates_mode()
{{< / highlight >}}


`self._mark_group_ids_as_exemptions` seems to be the meat and potatoes function that will finally actually mark group IDs as exemptions, and it seems to get its list of group IDs from whatever `self._books_for_group_map` is. I'm still not exactly sure about that naming convention. But I can guess from the name of the `_mark_group_ids` function that it returns *group* IDs, and I need *book* IDs. I have no way to know how to debug yet, so I just get to shooting from the hip, looking up that I can indeed iterate through what's returned by python's `.keys()` method, I end up with:


{{< highlight python3 "linenos=table,linenostart=1" >}}
# Get the IDs of all duplicate book groups
group_ids = self._books_for_group_map.keys()
for group_id in group_ids:
{{< / highlight >}}

And now guessing that there's a list of book IDs against each item in the `_books_for_group_map` I end up with

{{< highlight python3 "linenos=table,linenostart=1" >}}
# Get the IDs of all duplicate book groups
group_ids = self._books_for_group_map.keys()/home/caleb/Documents/personal/blog/content/posts/calibre-automerge/index.md
for group_id in group_ids:
    # Get the IDs of each book in this duplicate book group
    book_ids = self._books_for_group_map.get(group_id, [])
    if book_ids:
      call_some_function_that_takes_list_of_book_ids_on(book_ids)
{{< / highlight >}}

Totally shooting from the hip and have no idea if it's going to work. In fact, I think I made some syntactical errors in the above before getting it right, but I'll get to how I debugged that later.

With a list of book IDs in hand, now I need to figure out how to actually merge said books. No way I'm doing that manually: it was time to rest on someone else's hard work.

{{< figure src="mergebookscalibre.png" alt="Screenshot of the merge books option in Calibre." caption="Context menu option for merging books " >}}

Frontend strategy that's never failed me: full project string search for something I find on the View of an app. In this case, I wanna know how Calibre merges books under the hood, so I simply do a full project text search for what Calibre displays as the menu option to trigger a book merge: "Merge into first selected book". That brings me to Calibre's `edit_metadata.py`:

`/gui2/actions/edit_metadata.py`

{{< highlight python3 "linenos=table,linenostart=86" >}}
cm2('merge delete', _('Merge into first selected book - delete others'),
    triggered=self.merge_books)
{{< / highlight >}}

This has the same `triggered` paradigm that the duplicate finder plugin used for its own menu items, so I search for the `merge_books` function. This function is kinda large because of big blocks of template strings, so I stripped it down a bit in the following snippet:

`src/calibre/gui2/actions/edit_metadata.py`

{{< highlight python3 "linenos=table,hl_lines=33-35,linenostart=572" >}}
    def merge_books(self, safe_merge=False, merge_only_formats=False):
        '''
        Merge selected books in library.
        '''
        from calibre.gui2.dialogs.confirm_merge import confirm_merge
        if self.gui.current_view() is not self.gui.library_view:
            return
        rows = self.gui.library_view.indices_for_merge()
        if not rows or len(rows) == 0:
            return error_dialog(self.gui, _('Cannot merge books'),
                                _('No books selected'), show=True)
        if len(rows) < 2:
            return error_dialog(self.gui, _('Cannot merge books'),
                        _('At least two books must be selected for merging'),
                        show=True)
        if not self.confirm_large_merge(len(rows)):
            return

        dest_id, src_ids = self.books_to_merge(rows)
        mi = self.gui.current_db.new_api.get_proxy_metadata(dest_id)
        title = mi.title
        hpos = self.gui.library_view.horizontalScrollBar().value()
        if safe_merge:
            # ...
            self.add_formats(dest_id, self.formats_for_books(rows))
            self.merge_metadata(dest_id, src_ids)
        elif merge_only_formats:
            # ...
            self.add_formats(dest_id, self.formats_for_books(rows))
            self.delete_books_after_merge(src_ids)
        else:
            # ...
            self.add_formats(dest_id, self.formats_for_books(rows))
            self.merge_metadata(dest_id, src_ids)
            self.delete_books_after_merge(src_ids)
            # leave the selection highlight on first selected book
            dest_row = rows[0].row()
            for row in rows:
                if row.row() < rows[0].row():
                    dest_row -= 1
            self.gui.library_view.set_current_row(dest_row)
        cr = self.gui.library_view.currentIndex().row()
        self.gui.library_view.model().refresh_ids((dest_id,), cr)
        self.gui.library_view.horizontalScrollBar().setValue(hpos)
{{< / highlight >}}

Jumping to the if/elifs, I know I don't want to safe_merge, or merge_only_formats, I want a full merge where the duplicates are deleted after, so I look at the `else` block. The first line (after the template string I got rid of) is the first action I want to be taking with my merge: `add_formats`. That is, if I have multiple books selected, some with formats of MOBI and other in EPUB, the MOBI and EPUB will be stuck onto the merged, final book. So, looks like it takes at least one book ID, the `dest_id`, which by the naming conventions and menu paradigms I've been seeing I take to mean the "first selected book" mentioned in the context menu when trying to merge. But what about the other book IDs? They're taken as `self.formats_for_books(rows)`. Rows?! Here is where I confirmed that yup, looks like in Calibre-world, the way to get things done is accessing UI state from the code. The `rows` means whatever `rows` are in a selected state in the UI. Why that book data isn't stored as some sort of state cache is beyond me. Also weird, the next two actions, `merge_metadata` and `delete_books_after_merge` take `src_ids` directly, which, looking above, comes from `dest_id, src_ids = self.books_to_merge(rows)`. Not sure why `formats_for_books` can't take boo IDs directly, but oh well, it doesn't matter for now. I have what I need: I don't need to pass book IDs to `merge_books` after all, I instead need to select rows from the duplicate finder plugin, and then invoke calibre's `merge_books`. Seems SUPER weird to need to trigger UI state to pass around data, but whatever.

I need to select rows programmatically somehow, so that when I invoke the `merge_books` function, said books are merged. I have no idea how to do this, but I guess that it's done elsewhere in the Calibre code, and I hope that I can access said code from within the plugin somehow. At the end of the `merge_books` function is a bit of code that seems to trigger selection state in the UI:

`src/calibre/gui2/actions/edit_metadata.py`
{{< highlight python3 "linenos=table,linenostart=641" >}}
self.gui.library_view.set_current_row(dest_row)
{{< / highlight >}}

So on a totally wild guess, I hunt through the folder structure of Calibre. It says `gui.library_view`, well there's no "gui" folder but there is a "gui2" one (where `edit_metadata.py` is anyway), and within said folder is a `library` directory, and in said `library` directory is a `views.py` file. I guess that Calibre follows a kind of MVC structure, and that there's code... somewhere... that maps `self.gui` to `gui2` and `something_view` to a `views.py` file within a `something` directory. Real cowboy shit, but I was determined to get it done, or at least break code until I had nothing else to try.

Lo and behold, on a whim I text search "select rows" within `views.py` and find a `select_rows` function

`calibre/src/calibre/gui2/library/views.py`
{{< highlight python3 "linenos=table,linenostart=1227" >}}
def select_rows(self, identifiers, using_ids=True, change_current=True,
        scroll=True):
    '''
    Select rows identified by identifiers. identifiers can be a set of ids,
    row numbers or QModelIndexes.
    '''
{{< / highlight >}}


Literally exactly what I need. I just need to figure out how to invoke it from a plugin, and I'm done! So I head to the top of the `duplicates.py` file within the find-duplicates plugin to see how they're importing Calibre functionality.

`find-duplicates/duplicates.py`
{{< highlight python3 "linenos=table,linenostart=21" >}}
from calibre import prints
from calibre.constants import DEBUG
from calibre.gui2 import config, info_dialog, error_dialog
from calibre.gui2.dialogs.confirm_delete import confirm
from calibre.utils.logging import GUILog
{{< / highlight >}}

Looks straightforward enough. It appears that I can follow the same folder convention to import Calibre functionality that I had guessed at earlier to find the `select_rows` function. So I add:

`find-duplicates/duplicates.py`
{{< highlight python3 "linenos=table,linenostart=26" >}}
from calibre.gui2.library_view import select_rows
{{< / highlight >}}

Ok, and now to also grab the Calibre `merge_books` function. Again, totally guessing:

`find-duplicates/duplicates.py`
{{< highlight python3 "linenos=table,linenostart=27" >}}
from calibre.gui2.actions.edit_metadata import merge_books
{{< / highlight >}}

At this point I feel like I'm at the end of an impossibly thin tree branch just happily sawing away between me and the tree trunk. I've made a bunch of wild guesses and haven't run a single line of code yet. I realize that if I've made even one mistake it's only getting harder to debug where said mistake happened with every line I add, so I decide to get right into it. I add a `merge_all_groups` function to the find-duplicates plugin.


`find-duplicates/duplicates.py`
{{< highlight python3 "linenos=table,linenostart=363" >}}
    def merge_all_groups(self):
        # Get the IDs of all duplicate book groups
        group_ids = self._books_for_group_map.keys()
        for group_id in group_ids:
            # Get the IDs of each book in this duplicate book group
            book_ids = self._books_for_group_map.get(group_id, [])
            if book_ids:
                # Select all books in this group.
                select_rows(book_ids)
                # Invoke Calibre's native merge_books action, the same
                # one invoked if a user selects multiple books and
                # presses "g".
                merge_books()
{{< / highlight >}}

Ok and uhhh how do I actually trigger this function? I go back to how I originally found `mark_groups_as_duplicate_exemptions`, that bit of View code in `action.py`:

`find-duplicates/action.py`
{{< highlight python3 "linenos=table,linenostart=116" >}}
self.mark_group_exempt_action = create_menu_action_unique(self, m, _('&Mark current group as exempt'),
        tooltip=_('Mark the current group as not duplicates and exempt from future consideration'),
        triggered=partial(self.mark_groups_as_duplicate_exemptions, all_groups=False))
{{< / highlight >}}

Looks pretty straightforward, first create a menu action with `create_menu_action`, add a tooltip, and indicate which function will get invoked. After, of course, somehow importing that function, and... how is that done again? I follow back the triggered `mark_groups_as_duplicate_exemptions` to remember that oh yes, that function is defined in this `action.py` file, and is named identically to another function that I was looking at in `duplicates.py`, which the `action.py` version invokes as follows:

`find-duplicates/action.py`
{{< highlight python3 "linenos=table,hl_lines=18 20,linenostart=280" >}}
def mark_groups_as_duplicate_exemptions(self, all_groups):
     can_exempt = self.duplicate_finder.check_can_mark_exemption(all_groups)
     if can_exempt:
         # ensure that the selection is moved onto the current duplicate group
         duplicate_ids = self.duplicate_finder.get_current_duplicate_group_ids()
         self.gui.library_view.select_rows(duplicate_ids)
         exemption_type = 'books'
         if self.duplicate_finder.is_searching_for_authors():
             exemption_type = 'authors'
         dialog_name = 'find_duplicates_mark_all_groups' if all_groups else 'find_duplicates_mark_group'
         if not confirm('<p>' + _(
                         'this action will ensure that each of the {0} in the group '
                         'are exempt from appearing together again in future.<p>'
                         'are you <b>sure</b> you want to proceed?').format(exemption_type),
                         dialog_name, self.gui):
             return
         if all_groups:
             self.duplicate_finder.mark_groups_as_duplicate_exemptions()
         else:
             self.duplicate_finder.mark_current_group_as_duplicate_exemptions()
     else:
         info_dialog(self.gui, _('no duplicates in group'),
                     _('there are no duplicates remaining in this group.'),
                     show=true, show_copy_button=false)
     self.update_actions_enabled()
{{< / highlight >}}

I didn't see `mark_groups_as_duplicate_exemptions` getting exported in any way out of `duplicates.py`, so I guess that the functions that are `def`ined are automatically available on `self.duplicate_finder`. Now, I have everything I need. First, I add one of these `action.py` functions that I guess can just exist to do nothing other than invoke a `duplicate.py` function.

`find-duplicates/action.py`
{{< highlight python3 "linenos=table,linenostart=306" >}}
def merge_all_groups(self):
    self.duplicate_finder.merge_all_groups()
    self.update_actions_enabled()
{{< / highlight >}}

Now, add a menu item that will trigger my new function:

`find-duplicates/action.py`
{{< highlight python3 "linenos=table,linenostart=123" >}}

self.merge_all_groups_action = create_menu_action_unique(self, m,
                        _('&Merge all groups'),
                        tooltip=_('Merge all the groups, showing confirmation box for each group. Consider backing up your library first.'),
                        triggered=partial(self.merge_all_groups))
{{< / highlight >}}

And for the grand finale... somehow get my code into Calibre! Which I figure to be *very hard*, because I installed find-duplicates via interaction through the Calibre UI, so I guess there's some kind of Calibre-managed repository that I have no idea how to update. So I duck duck go for "how to make a Calibre plugin" and am directed to a [page that Calibre has helpfully created](https://manual.calibre-ebook.com/creating_plugins.html). The critical bit of information that makes it all very easy is:


> That’s all. To add this code to calibre as a plugin, simply run the following in the folder in which you created `__init__.py`:
> `calibre-customize -b .`

So, I do just that. Calibre launches! And the instantly crashes, with no displayed errors. So now onto debugging! Luckily, [Calibre's website has a section on debugging](https://manual.calibre-ebook.com/creating_plugins.html). Unluckily, the creator offers nothing in the form of stepping through a program, and instead says:

> You can insert print statements anywhere in your plugin code, they will be output in debug mode. Remember, this is Python, you really shouldn’t need anything more than print statements to debug ;) I developed all of calibre using just this debugging technique.

Remember friends, only nerds actually step through their code. Cool kids just throw `print` statements everywhere :)

So anyway I run Calibre in debug mode with `calibre-debug -g`, launch, and check out what errors I'm getting. Now for an admission: I'm actually writing this blog post from memory, and apparently I failed to record the various errors I was getting, so I unfortunately can't display them verbatim. However, they were in effect `import` errors, wherein python couldn't find modules I was trying to import. So my little guess at how to import functions from Calibre was wrong. I played with the syntax a bit to see if maybe I had just guessed wrong at how the folder structure worked, but didn't get any new results. So, I went back to the code, to see if there was something else I could copy from the plugin. Was there any place where something else from Calibre getting imported into the find-duplicates plugin?

I poke around the code for a while, and while re-examining `mark_groups_as_duplicate_exemptions`, I stumble back upon the confusion I had earlier around seeing `select_rows` there. Right in front of my face was the Calibre function I needed in order to select rows!

`find-duplicates/action.py`
{{< highlight python3 "linenos=table,hl_lines=6,linenostart=280" >}}
def mark_groups_as_duplicate_exemptions(self, all_groups):
    can_exempt = self.duplicate_finder.check_can_mark_exemption(all_groups)
    if can_exempt:
        # Ensure that the selection is moved onto the current duplicate group
        duplicate_ids = self.duplicate_finder.get_current_duplicate_group_ids()
        self.gui.library_view.select_rows(duplicate_ids)
        # ...
{{< / highlight >}}

I guess gui methods are available on `self` under `self.gui`! Nice. Is that true in `duplicates.py` as well? I check to see if `self.gui` can be found in `duplicates.py` with a full text search and see that not only does it do so, there's also a place there that uses a `library_view` row selection function


`find-duplicates/duplicates.py`
{{< highlight python3 "linenos=table,hl_lines=3,linenostart=411" >}}
def show_all_exemptions(self, for_books=True):
    # ...
    self.gui.library_view.set_current_row(0)
{{< / highlight >}}

Which I take to mean that the `select_rows` function is also available. So I modify my `merge_all_groups` function:

`find-duplicates/duplicates.py`
{{< highlight python3 "linenos=table,linenostart=363" >}}
    def merge_all_groups(self):
        # Get the IDs of all duplicate book groups
        group_ids = self._books_for_group_map.keys()
        for group_id in group_ids:
            # Get the IDs of each book in this duplicate book group
            book_ids = self._books_for_group_map.get(group_id, [])
            if book_ids:
                # Select all books in this group.
                self.gui.library_view.select_rows(book_ids)
                # Invoke Calibre's native merge_books action, the same
                # one invoked if a user selects multiple books and
                # presses "g".
                merge_books()
{{< / highlight >}}

Now to invoke Calibre's `merge_books` however it wants that function invoked. This turns out to be way harder to find. I start by trying to see if any of the other functions inside of Calibre's `edit_metadata.py` file are invoked elsewhere in the find-duplicates plugin, and sadly, they aren't. So I start doing full project text searches in Calibre itself to see how *Calibre* accesses those functions when it needs to. I find a hit with the `edit_metadata` function, which is invoked in `calibre/gui2/library/alternate_views.py`:

`calibre/gui2/library/alternate_views.py`
{{< highlight python3 "linenos=table,hl_lines=2,linenostart=66" >}}
elif tweak == 'edit_metadata':
    gui.iactions['Edit Metadata'].edit_metadata(False)
{{< / highlight >}}
