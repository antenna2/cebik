# Cebik W4RNL (SK) Website and Document Collection

This is the version hosted at [www.antenna2.net/cebik](https://www.antenna2.net/cebik/)

The version of Cebik's site hosted here is derived from what Marcel had hosted at [http://www.on5au.be](http://www.on5au.be).

There were two versions - one appears to be from an antenneX CDROM mostly as-is, and another with different index pages. This one is the antenneX version as it was the most original, with additional and missing content merged into it to create the most up-to-date version possible.

The Cebik website style and layout is very dated by today's standards, it appears most of the pages were created with HTMLed Pro which dates back to the 90s, some from Word documents, and others possibly written by hand in a text editor.

- Pages updated to syntax correct HTML with CSS setting the styling. However they still contain obsolete HTML3 elements.
- Some missing/orphaned modeling, VHF, and wire antenna content found and added.
- For better readability, background [image](content/images/lightppr.gif) replaced with similar solid background color, pre-formatted text no longer bold and has a different background color set with borders.
- De-duplicated symposiums and magazine articles, linked original HTML pages the PDFs were created from.
- Broken internal links have been fixed, and where possible external broken links have been updated with copies stored by the Internet Archive.
- The online Moxon Rectangle calculator has been updated and moved to the top of the page.
- Topic index, page title updates (used for the link names in the topic index).
- Page header text and formatting (some pages), and switching from h2 to h1 tag (SEO).
- A combination of custom Python scripts (written with help from ChatGPT) and [HTML Tidy](https://www.html-tidy.org/) were used to tidy and update the HTML with styling set by one CSS file. As a result the pages load and render faster. A copy of the scripts can be found on Github [here](https://github.com/lonney9/HTML-Scripts).
- Otherwise the overall look and feel of the Cebik site is maintained.

## Update Process for Reference

Basically what I did over several months.

### Broken Links

An application called [Deep Trawl](https://github.com/htacg/tidy-html5/releases/tag/5.8.0) and a combination of find and grep queries were used to find broken links. Internal broken links corrected, external broken links point to [Internet Web Archive](https://www.archive.org/) copies, external links updated to use https where possible and open in a new tab (target="_blank").

### Moxon Javascript Calculator

The [Online Moxon Calculator](content/moxon/moxpage.html) relied on a second `<body>` tag part way down the page to function. Code was updated (using ChatGPT) to remove this dependance, add the 93 ohm option and a calculate button.

### HTML Syntax Issues

A combination of custom Python scripts (written with help from ChatGPT) [https://github.com/lonney9/HTML-Scripts](https://github.com/lonney9/HTML-Scripts) and [HTML Tidy](https://www.html-tidy.org/) were used to tidy and update the HTML with styling set by one CSS file. As a result the pages load and render faster in standards compliant mode.

1. HTML tag cleanup removes:
   - HTML doctype line matching `<!DOCTYPE HTML PUBLIC` (case insensitive).
   - Elements from the body tag simplifying to `<body>`.
   - Opening and closing font tags `<font> </font>`.
   - Alt attribute from `<img>` tags (case-insensitive), these contained the image name and size (not useful).
   - Bold tags `<b> </b>` from around the `<pre> </pre>` tags.
   - Hyphens `-` from in-front of the words `wavelength` and `degrees`.
2. HTML Tidy run with out CSS option, output encoding US-ACSII - this converts non standard characters to HTML entities. This tidies the HTML and corrects syntax errors, HTML tidy has bugs which don't handle every situation, a number of manual edits were made to the HTML to allow for this.
3. Add CSS link to each page, the relative path is calculated and used.
4. Image de-duplication, navigation and header image files were found throughout the directory structure. Image names were identified, script moved them into an /images folder, updated the paths with relative links, then instances of that image then deleted.

This sequence of scripts were run dozens of times by making a copy of the source HTML, and checking the results, fixing small issues, and repeating until no more issues were found.

### File Structure

The file structure was tidied, images relocated from content/ root, PVC page and images moved into their own directory, links pages and images moved into their down directory, books and downloads page updated, couple instances where it made sense to merge pages that was done.

## To Do List

- Magazines page: Find better/smaller file size PDF copies of "NEC and MININEC Guide to Further Information" (4.4 mb), and "NEC-4.1.
- Limitations of Importance to Hams" (22mb) - these are images.
- Edit PDF files to remove references to defunct Cebik and antenneX domains.
- Finish updating page titles and set meta keywords on the magazine column pages (around 250 pages), and add them into the Topic Index.
- Add linked navigation footer and index pages based on directory structure.
- Improve viewing on mobile devices.

## Visitor Statistics

[https://github.com/lonney9/Go-Access](https://github.com/lonney9/Go-Access).

## Serve over Local Network

With Python installed run the following from with-in the top level, and it will serve it over http.

E.g. to serve cebik/ after cloning it:

```bash
cd cebik
python3 -m http.server 8000
```

## Nested Repos www-live and cebik

I decided to use nested repos at this time with .gitignore configured to ignore the nested or sub repo(s) with-in.

This seemed to be the simplest way to do it with out more complex git commands I found in other examples.

To replicate the same setup I use, clone www-live first, then cd into www-live and clone cebik.

This is only useful to test the entire site locally if needed.

.gitignore in www-live handles ignoring the nested cebik repo.
