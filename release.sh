pushd dist
for file in ./plotly*.tar.gz
do
  mv $file mode-$file
  package_cloud push modeanalytics/python-beta/python mode-$file
done
popd
