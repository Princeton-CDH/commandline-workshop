#!/bin/bash

wget https://www.gutenberg.org/ebooks/2263.txt.utf-8
sed '1,379d' 2263.txt.utf-8 > shakespeare-minus-header.txt
