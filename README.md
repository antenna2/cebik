# Cebik W4RNL (SK) Website and Document Collection

This is the version hosted at [www.antenna2.net/cebik](https://www.antenna2.net/cebik/)

Updates include:

- Pages updated to compliant HTML with CSS setting the styling.
- Books and model sets added (included with additional downloads with purchase of ON5AU's AAM book).
- Some missing/orphaned modeling, VHF, and wire antenna content found and added.
- For better readability, background image replaced with similar solid background color, preformatted text no longer bold and has a different background color set with borders.
- De-duplicated symposiums and magazine articles, linked original HTML pages the PDFs were created from.
- Broken internal links have been fixed, and where possible external broken links have been updated with copies stored by the Internet Archive.
- The online Moxon Rectangle calculator has been moved to the top of the page, and includes a 93 ohm option used in the Turnstile Moxon Rectangle Fixed-Position Satellite Antennas page.
- Otherwise the overall look and feel of the Cebik pages is maintained.

## Update Process

### Broken Links

An application called Deep Trawl and a combination of find and grep queries were used to find broken links. Internal broken links corrected, external broken links point to [Internet Web Archive](https://www.archive.org/) copies, external links updated to use https where possible and open in a new tab (target="_blank").

### Moxon Javascript Calculator

The [Online Moxon Calculator](https://www.antenna2.net/cebik/content/moxon/moxpage.html) relied on a second `<body>` tag part way down the page to function. Code was updated (using ChatGPT) to remove this depdance, add the 93 ohm option and a calculate button.

### HTML Syntax Issues

A combination of custom Python scripts (written with help from ChatGPT) [https://github.com/lonney9/HTML-Scripts](https://github.com/lonney9/HTML-Scripts) and [HTML Tidy](https://www.html-tidy.org/) were used to tidy and update the HTML with styling set by one CSS file. As a result the pages load and render faster in standards compliant mode.

1. HTML tag cleanup removes:
   - HTML doctype line matching `<!DOCTYPE HTML PUBLIC` (case insensitive).
   - Elements from the body tag simplifying to `<body>`.
   - Opening and closing font tags `<font> </font>`.
   - Alt attribute from `<img>` tags (case-insensitive), these contained the img name and size (not useful).
   - Bold tags `<b> </b>` from around the `<pre> </pre>` tags.
   - Hyphens `-` from infront of the words `wavelegth` and `degrees`.
2. HTML Tidy run with out CSS option, output encoding US-ACSII - this converts non standard characters to HTML entities. This tidies the HTML and corrects syntax errors, HTML tidy has bugs which dont handle every situation, a number of manual edits were made to the HTML to allow for this.
3. Add CSS link to each page, the relative path is calculated and used.
4. Image de-duplication, navigation and header image files were found throughout the directory structure. Image names were identified, script moved them into an /images folder, updated the paths with relative links, then instances of that image then deleted.

This sequence of scripts were run dozens of times by making a copy of the source HTML, and checking the results, fixing small issues, and repeating until no more issues were found.

### File Structure

The file structure was tidied, images relocated from content/ root, PVC page and images moved into their own directory, links pages and images moved into their down directory, books and downloads page updated, couple instances where it made sense to merge pages that was done.

## To Do List

- Magazines page: Find better/smaller file size PDF copies of "NEC and MININEC Guide to Further Information" (4.4 mb), and "NEC-4.1.
- Limitations of Importance to Hams" (22mb) - these are images.
- Edit PDF files to remove references to defunt cebik and antennex domains.
- Finish updating page titles and set meta keywords on the magazine column pages (around 250 pages), and add them into the Topic Index.
- Add linked navigation footer and index pages based on directory structure.
- Improve viewing on mobile devices.

## Visitor Statistics

[https://github.com/lonney9/Go-Access](https://github.com/lonney9/Go-Access).

### Sitemap.xml

Shell script used generate sitemap.xml

### Robots.txt

Disallows indexing PDF books and magazine articles that were not part of the original Cebik site.

## Nested Repos www-live and cebik

Useful if you want to serve the site over the local network.

With Python installed run the following from with-in the web root level, e.g. www-live:

```bash
python3 -m http.server 8000
```

To replicate the same setup I use, clone www-live first, then cd into www-live and clone cebik.

.gitignore in www-live handles not including the nested cebik repo.
