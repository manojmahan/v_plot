# v_plot
Project aim is to plot the Vplot

Clone the repositery and change the directory to the v_vlot
~~~
git clone https://github.com/manojmahan/v_plot.git
cd v_plot
~~~

**Creating Virtual enviornment**
run the followring command 
~~~
mamba create -n vlot_env pandas numpy matplotlib
~~~
to activate this env run
~~~
mamba activate vplot_env
~~~

## download the data 
~~~
curl -JLO "https://figshare.com/ndownloader/files/49307590?private_link=972ecdfe69d6ce038ca0" -o data/mapped.bed.gz
~~~
Run the main bash script file in order to get the linear transformation of the data as well as the Vplot using python
~~~
sh bash_script.sh
~~~
