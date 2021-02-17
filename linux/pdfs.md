# Portable Document Format on Linux


## Making a PDF from Multiple Files:
I prefer `img2pdf` over `convert`.
It has a lower memory footprint and `convert` will crash on my cloudbook if there are more than 14 pages of 300 dpi pngs.
```bash
img2pdf -o output.pdf JPG1 [JPG2 [...]]
```

To install `img2pdf` on Debian: `sudo apt install img2pdf`
