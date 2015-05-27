Spinner
==============

Creates a beautiful animation for you to show while loading data for your views

https://youtu.be/nUhC05pGTjA

## Usage
1. Import all images and SpinnerView.swift in your existing project.
2. Initialise a new istance of VMGearLoadingView: 
	var spinner = VMGearLoadingView(showGearLoadingForView: self.view)
3. Hide when necessary with: 
	if let spinner = getGearLoadingForView(self.view) as? VMGearLoadingView{
            spinner.hideGearLoadingForView(spinner)
        }

## Demo
Included in project

## TODO
1. Optimization

## Notes
This is a swift port of `VMGearLoadingView ` made by VuMai (https://github.com/VuMai/VMGearsLoading).


## License
MIT
