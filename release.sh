for file in dist/plotly*.tar.gz
do
  mv $file mode-$file
  package_cloud push modeanalytics/python-beta/python mode-$file
done
