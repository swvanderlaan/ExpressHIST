#!/bin/bash

# Testig PyHIST

EXPRESSHIST="/Users/slaan3/git/ExpressHIST"

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

for METHOD in adaptive; do 
	for PATCHSIZE in 2000 1024 512 256; do 
		for CONTENTTHRESHOLD in 0.20 0.15 0.10 0.05; do 
			for OUTPUTDOWN 2 4 16; do 
				for IMAGE in AE3606.GLYCC AE3756.GLYCC AE3884.GLYCC AE4022.GLYCC AE4611.GLYCC AE4612.GLYCC ; do

					echo "Testing method [ $METHOD ] for image [ $IMAGE ] at patchsize [ $PATCHSIZE ] with content threshold [ $CONTENTTHRESHOLD ] and down sampling [ $OUTPUTDOWN ]..."
				# 	--corners 1011 --borders 0000 --percentage-bc 5 \	
					python3 $EXPRESSHIST/pyhist.py --content-threshold $CONTENTTHRESHOLD \
					--patch-size $PATCHSIZE --output-downsample $OUTPUTDOWN --info "verbose" \
					--method "$METHOD" \
					--save-patches --save-mask --save-tilecrossed-image \
					$(pwd)/${IMAGE}/${IMAGE}.TIF

					mv -v $(pwd)/${IMAGE}/${IMAGE}.tiles $(pwd)/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct${CONTENTTHRESHOLD}.o${OUTPUTDOWN}/
					mv -v $(pwd)/${IMAGE}/mask_* $(pwd)/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct${CONTENTTHRESHOLD}.o${OUTPUTDOWN}/
					mv -v $(pwd)/${IMAGE}/tile_selection.tsv $(pwd)/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct${CONTENTTHRESHOLD}.o${OUTPUTDOWN}/
					mv -v $(pwd)/${IMAGE}/tilecrossed_* $(pwd)/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct${CONTENTTHRESHOLD}.o${OUTPUTDOWN}/
				done
			done
		done
	done
done




