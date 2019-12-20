# plotly.py

<table>
    <tr>
        <td>Latest Release</td>
        <td>
            <a href="https://pypi.org/project/plotly/"/>
            <img src="https://badge.fury.io/py/plotly.svg"/>
        </td>
    </tr>
    <tr>
        <td>PyPI Downloads</td>
        <td>
            <a href="https://pepy.tech/project/plotly"/>
            <img src="https://pepy.tech/badge/plotly/month"/>
        </td>
    </tr>
    <tr>
        <td>License</td>
        <td>
            <a href="https://opensource.org/licenses/MIT"/>
            <img src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
        </td>
    </tr>
</table>

---

## NOTE

__**This is a fork of Plotly modified for use in Mode's native Python notebook environment.**__

To test work on Mode's fork of Plotly you will need to do the following:

1. ensure these Mode services are running:

  * Jiffypop: https://github.com/mode/go-mono/tree/master/jiffypop
  * Python 3 runtime: https://github.com/mode/runtime-images/tree/master/runtime-python3
  * The following services in the JVM mono repo: https://github.com/mode/jvm-mono
    * DirectConnect
    * Credguard
    * Flamingo
    * Zookeeper

2. After saving changes to the Plotly repo, if your local Python3 Docker container is running  stop and restart it:
  * Restart the container with `./runtime-python3/bin/run-runtime-python3-image-0` in the `runtime-images` directory

3. Execute this command within the `plotly.py` directory to apply your changes to the Python runtime:
`docker cp ./packages/python/plotly/. $(docker container ps --filter name=runtime-python3 -q):/opt/conda/envs/python3/lib/python3.6/site-packages/`

4. Click "Restart" in the web application notebook.

5. Verify you're running your local version of Plotly by executing this code in the notebook, which should print out `'0+unknown'`:
```
import plotly
plotly.__version__
```

---

## Quickstart

`pip install plotly "notebook>=5.3" "ipywidgets>=7.2"`

Inside [Jupyter notebook](https://jupyter.org/install):
```python
import plotly.graph_objs as go
fig = go.FigureWidget()
# Display an empty figure
fig
```
```python
# Add a scatter chart
fig.add_scatter(y=[2, 1, 4, 3])
# Add a bar chart
fig.add_bar(y=[1, 4, 3, 2])
# Add a title
fig.layout.title = 'Hello FigureWidget'
```

See the [Python documentation](https://plot.ly/python/) for more examples.

Read about what's new in [plotly.py v3](https://medium.com/@plotlygraphs/introducing-plotly-py-3-0-0-7bb1333f69c6)

## Overview
[plotly.py](https://plot.ly/d3-js-for-python-and-pandas-charts/) is an interactive, open-source, and browser-based graphing library for Python :sparkles:

Built on top of [plotly.js](https://github.com/plotly/plotly.js), `plotly.py` is a high-level, declarative charting library. plotly.js ships with over 30 chart types, including scientific charts, 3D graphs, statistical charts, SVG maps, financial charts, and more.

`plotly.py` is [MIT Licensed](packages/python/chart-studio/LICENSE.txt). Plotly graphs can be viewed in Jupyter notebooks, standalone HTML files, or hosted online on [plot.ly](https://plot.ly).

[Contact us](https://plot.ly/products/consulting-and-oem/) for Plotly.js consulting, dashboard development, application integration, and feature additions. Sharing your graphs online or in dashboards? Consider a [plot.ly subscription](https://plot.ly/products/cloud).

<p align="center">
    <a href="https://plot.ly/python" target="_blank">
    <img src="https://raw.githubusercontent.com/cldougl/plot_images/add_r_img/plotly_2017.png">
</a></p>

***

- [Online Documentation](https://plot.ly/python)
- [Contributing](contributing.md)
- [Changelog](packages/python/plotly-geo/CHANGELOG.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Version 3 Migration Guide](migration-guide.md)
- [New! Announcing Dash](https://medium.com/@plotlygraphs/introducing-dash-5ecf7191b503)
- [Community](https://community.plot.ly/c/api/python)

***

## Installation

plotly.py may be installed using pip...
```
pip install plotly==4.1.0
```

or conda.
```
conda install -c plotly plotly==4.1.0
```

### Jupyter Notebook Support
For use in the Jupyter Notebook, install the `notebook` and `ipywidgets`
packages using pip...

```
pip install "notebook>=5.3" "ipywidgets==7.5"
```

or conda.

```
conda install "notebook>=5.3" "ipywidgets=7.5"
```

### JupyterLab Support (Python 3.5+)
For use in JupyterLab, install the `jupyterlab` and `ipywidgets`
packages using pip...

```
pip install jupyterlab==1.0 "ipywidgets==7.5"
```

or conda.

```
conda install jupyterlab=1.0 "ipywidgets=7.5"
```

Then run the following commands to install the required JupyterLab extensions:
```
# Avoid "JavaScript heap out of memory" errors during extension installation
# (OS X/Linux)
export NODE_OPTIONS=--max-old-space-size=4096
# (Windows)
set NODE_OPTIONS=--max-old-space-size=4096

# Jupyter widgets extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.0 --no-build

# FigureWidget support
jupyter labextension install plotlywidget@1.1.0 --no-build

# and jupyterlab renderer support
jupyter labextension install jupyterlab-plotly@1.1.0 --no-build

# JupyterLab chart editor support (optional)
jupyter labextension install jupyterlab-chart-editor@1.2 --no-build

# Build extensions (must be done to activate extensions since --no-build is used above)
jupyter lab build

# Unset NODE_OPTIONS environment variable
# (OS X/Linux)
unset NODE_OPTIONS
# (Windows)
set NODE_OPTIONS=
```

### Static Image Export
plotly.py supports static image export using the `to_image` and `write_image`
functions in the `plotly.io` package. This functionality requires the
installation of the plotly [orca](https://github.com/plotly/orca) command line utility and the
[`psutil`](https://github.com/giampaolo/psutil) Python package.

These dependencies can both be installed using conda:
```
conda install -c plotly plotly-orca psutil
```

Or, `psutil` can be installed using pip...
```
pip install psutil
```

and orca can be installed according to the instructions in the [orca README](https://github.com/plotly/orca).

### Extended Geo Support
Some plotly.py features rely on fairly large geographic shape files. The county
choropleth figure factory is one such example. These shape files are distributed as a
separate `plotly-geo` package.  This package can be installed using pip...

```
pip install plotly-geo==1.0.0
```

or conda
```
conda install -c plotly plotly-geo=1.0.0
```

### Chart Studio support
The `chart-studio` package can be used to upload plotly figures to Plotly's Chart
Studio Cloud or On-Prem service.  This package can be installed using pip...

```
pip install chart-studio==1.0.0
```

or conda
```
conda install -c plotly chart-studio=1.0.0
```

## Migration
If you're migrating from plotly.py version 3, please check out the [Version 4 migration guide](https://plot.ly/python/next/v4-migration/)

If you're migrating from plotly.py version 2, please check out the [Version 3 migration guide](migration-guide.md)

## Copyright and Licenses
Code and documentation copyright 2019 Plotly, Inc.

Code released under the [MIT license](packages/python/chart-studio/LICENSE.txt).

Docs released under the [Creative Commons license](https://github.com/plotly/documentation/blob/source/LICENSE).
