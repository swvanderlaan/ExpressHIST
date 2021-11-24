#!/bin/bash

# Testig PyHIST

OUTPUT="/Users/slaan3/git/PyHIST/output"
IMAGEFILE="AE1468.CD68"
UPGRADESTUDY="/Users/slaan3/git/swvanderlaan/slideToolKit/upgrade_study"
STAIN="CD68"

# for M in graph adaptive otsu ; do
# 	METHOD=$M
# 	### DEBUG
# 	### ls -lh ${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 	
# 	echo "Testing method [ $M ]..."
# 	
# 	python3 pyhist.py --content-threshold 0.05 \
# 	--patch-size 2000 --output-downsample 2 --info "verbose" \
# 	--method "$METHOD" \
# 	--save-patches --save-mask --save-tilecrossed-image \
# 	${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 
# 	mv -v ${OUTPUT}/${IMAGEFILE} ${OUTPUT}/${IMAGEFILE}_${METHOD}
# 	
# done
# 
# 
# for M in graph adaptive otsu ; do
# for M in graph ; do
# 	METHOD=$M
# 	### DEBUG
# 	### ls -lh ${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 	
# 	echo "Testing method [ $M ]..."
# 	
# 	python3 pyhist.py --content-threshold 0.25 \
# 	--patch-size 2000 --output-downsample 2 --info "verbose" \
# 	--method "$METHOD" \
# 	--save-patches --save-mask --save-tilecrossed-image \
# 	${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 
# 	mv -v ${OUTPUT}/${IMAGEFILE} ${OUTPUT}/${IMAGEFILE}_${METHOD}_ct25
# 	
# done
# 
# 
# for M in graph ; do
# 	METHOD=$M
# 	### DEBUG
# 	### ls -lh ${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 	
# 	echo "Testing method [ $M ]..."
# 	
# 	python3 pyhist.py --content-threshold 0.25 \
# 	--patch-size 2000 --output-downsample 2 --info "verbose" \
# 	--method "$METHOD" \
# 	--save-patches --save-mask --save-tilecrossed-image \
# 	--save-edges \
# 	--corners 1111 --borders 0000 \
# 	${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 
# 	mv -v ${OUTPUT}/${IMAGEFILE} ${OUTPUT}/${IMAGEFILE}_${METHOD}_ct25_corners
# 	
# done

# for M in graph ; do
# 	METHOD=$M
# 	### DEBUG
# 	### ls -lh ${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 	
# 	echo "Testing method [ $M ]..."
# 	
# 	python3 pyhist.py --content-threshold 0.05 \
# 	--patch-size 512 --output-downsample 4 --info "verbose" \
# 	--method "$METHOD" \
# 	--save-patches --save-mask --save-tilecrossed-image \
# 	--save-edges --save-blank \
# 	--corners 1011 --borders 0000 --percentage-bc 5 \
# 	${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
# 
# 	mv -v ${OUTPUT}/${IMAGEFILE} ${OUTPUT}/${IMAGEFILE}_${METHOD}_ct25_corners1011_percbc5
# 	
# done

for M in adaptive ; do
	METHOD=$M
	### DEBUG
	### ls -lh ${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF
	
	echo "Testing method [ $M ]..."
# 	--corners 1011 --borders 0000 --percentage-bc 5 \	
	python3 pyhist.py --content-threshold 0.20 \
	--patch-size 512 --output-downsample 4 --info "verbose" \
	--method "$METHOD" \
	--save-patches --save-mask --save-tilecrossed-image \
	--save-edges --save-blank \
	${UPGRADESTUDY}/${STAIN}/${IMAGEFILE}/${IMAGEFILE}.TIF

	mv -v ${OUTPUT}/${IMAGEFILE} ${OUTPUT}/${IMAGEFILE}_${METHOD}_ct20_cornersDEF_percbcDEF
	
done