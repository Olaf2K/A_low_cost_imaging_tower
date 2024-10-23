// the macro
folder_loc = ""


list = getFileList(folder_loc);

for (xx=0;xx<list.length;xx++){
file = list[xx];

// main
open(folder_loc+file);


run("8-bit");

run("Subtract Background...", "rolling=50 sliding");

run("Enhance Contrast...", "saturated=5"); 

// change saturated= to the percentage you want



run("Threshold...");

setThreshold(6, 46);

setOption("BlackBackground", false);

run("Convert to Mask");



run("Despeckle");


//run("Remove Outliers...", "radius=10 threshold=100 which=Bright");
run("Convert to Mask");

run("Watershed");


run("Remove Outliers...", "radius=5 threshold=50 which=Dark");



//run("Watershed");


waitForUser("Please draw a ROI on the area of interest. Please exclude the edges of the plate including bits of parafilm and click 'OK'.");


run("Analyze Particles...", "size=[] circularity=0 show=Outlines summarize add");



name_string = file;

tiff_string = '.tiff';
outname = folder_loc+name_string+tiff_string;
saveAs("Tiff", outname);
close();


}
