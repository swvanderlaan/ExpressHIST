#!/bin/bash

# Reference
# https://stackoverflow.com/questions/8903239/how-to-calculate-time-elapsed-in-bash-script
SECONDS=0
# do some work

echo "== Testig ExpressHIST (fork from PyHIST) - version 0.9 | Sander W. van der Laan | s.w.vanderlaan@gmail.com =="

echo ""
### Loading the CellProfiler-Anaconda3.8 environment
### You need to also have the conda init lines in your .bash_profile/.bashrc file
echo "== Loading required anaconda environment containing the CellProfiler installation =="
eval "$(conda shell.bash hook)"
conda activate cp4


EXPRESSHIST="/Users/slaan3/git/swvanderlaan/ExpressHIST"

mkdir -v $(pwd)/_all_tiles
mkdir -v $(pwd)/_all_tiles/_tilescrossed

### Testing scenarios
# for METHOD in adaptive; do 
# 	for PATCHSIZE in 2000 512 256; do 
# 		for CONTENTTHRESHOLD in 0.20 0.15 0.10 0.05; do 
# 			for OUTPUTDOWN in 2 4 16; do 
# 				for IMAGE in AE3606.GLYCC AE3756.GLYCC AE3884.GLYCC AE4022.GLYCC AE4611.GLYCC AE4612.GLYCC ; do
# 					echo "Testing method [ $METHOD ] for image [ $IMAGE ] at patchsize [ $PATCHSIZE ] with content threshold [ $CONTENTTHRESHOLD ] and down sampling [ $OUTPUTDOWN ]..."
# 					python3 $EXPRESSHIST/pyhist.py --content-threshold $CONTENTTHRESHOLD \
# 					--patch-size $PATCHSIZE --output-downsample $OUTPUTDOWN --info "verbose" \
# 					--method "$METHOD" \
# 					--save-mask --save-tilecrossed-image \
# 					$(pwd)/${IMAGE}/${IMAGE}.ndpi
# 
# 					echo ""
# 					echo "Cleaning house."
# 					mv -v $(pwd)/${IMAGE}/mask_* $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct${CONTENTTHRESHOLD}.o${OUTPUTDOWN}.mask.png
# 					mv -v $(pwd)/${IMAGE}/tilecrossed_* $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct${CONTENTTHRESHOLD}.o${OUTPUTDOWN}.tilescrossed.png
# 
# 				done
# 			done
# 		done
# 	done
# done

### Converting results to combined PDFs
# for METHOD in adaptive; do 
# 	for PATCHSIZE in 2000 512 256; do 
# 		for IMAGE in AE3606.GLYCC AE3756.GLYCC AE3884.GLYCC AE4022.GLYCC AE4611.GLYCC AE4612.GLYCC ; do
# 		# Reference
# 		# https://stackoverflow.com/questions/47453839/use-imagemagick-to-combine-multiple-pngs-into-single-pdf
# 		
# 		convert -background white -size 10x10 $(pwd)/_all_tiles/${IMAGE}.macro.png xc:none \
# 		-background white -size 10x10 $(pwd)/_all_tiles/${IMAGE}.mask.png \
# 		+append -resize x500 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.page-01.png
# 		
# 		convert -background white -size 10x10 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.20.o2.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.15.o2.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.10.o2.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.05.o2.tilescrossed.png \
# 		+append -resize 2480x3508 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.page-02.png
# 		
# 		convert -background white -size 10x10 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.20.o4.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.15.o4.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.10.o4.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.05.o4.tilescrossed.png \
# 		+append -resize 2480x3508 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.page-03.png
# 		
# 		convert -background white -size 10x10 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.20.o16.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.15.o16.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.10.o16.tilescrossed.png xc:none \
# 		$(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.05.o16.tilescrossed.png \
# 		+append -resize 2480x3508 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.page-04.png
# 		
# 		convert $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.page-0*.png -append -resize 2480x3508 $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.combined.pdf
# 		mv -v $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.ct0.*.o*.tilescrossed.png $(pwd)/_all_tiles/_tilescrossed/
# 		mv -v $(pwd)/_all_tiles/${IMAGE}.${METHOD}.p${PATCHSIZE}.page-0*.png $(pwd)/_all_tiles/_tilescrossed/
# 		
# 		done
# 	done
# done


### For testing CP analyses
for METHOD in adaptive; do 
	for PATCHSIZE in 2000; do 
		for CONTENTTHRESHOLD in 0.05; do 
			for OUTPUTDOWN in 2; do 
# 				for IMAGE in AE3606.GLYCC AE3756.GLYCC AE3884.GLYCC AE4022.GLYCC AE4611.GLYCC AE4612.GLYCC ; do
				for IMAGE in AE3606.GLYCC ; do
					echo "Testing method [ $METHOD ] for image [ $IMAGE ] at patchsize [ $PATCHSIZE ] with content threshold [ $CONTENTTHRESHOLD ] and down sampling [ $OUTPUTDOWN ]..."
					python3 $EXPRESSHIST/pyhist.py --content-threshold $CONTENTTHRESHOLD \
					--patch-size $PATCHSIZE --output-downsample $OUTPUTDOWN --info "verbose" \
					--method "$METHOD" \
					--save-mask --save-patches --save-tilecrossed-image \
					$(pwd)/${IMAGE}/${IMAGE}.ndpi
				done
			done
		done
	done
done

WORKDIR=$(pwd)

### For testing tile normalization
# for IMAGE in AE3606.GLYCC AE3756.GLYCC AE3884.GLYCC AE4022.GLYCC AE4611.GLYCC AE4612.GLYCC ; do
for IMAGE in AE3606.GLYCC ; do
	cd $WORKDIR/${IMAGE}/${IMAGE}.tiles/
	
	for IMAGE_TILE in *.tile.tissue.png; do
		echo "...Processing tile [ $IMAGE_TILE ]"
		echo "... - applying normalization ..."
		slideNormalize $IMAGE_TILE;
		
		echo "... - removing intermediate [ $IMAGE_TILE ] ..."
#  		rm -v $IMAGE_TILE;
		
	done
	cd $WORKDIR
done

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."



### DEBUGGING OTHER METHODS
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

