#!/bin/bash

rm -R bindings_with_collect

mkdir bindings_with_collect

# jaxb-ri/bin/xjc.sh -d bindings/ -b ../_binding/bindings.xjb -catalog ../_schema/iwxxm/2.0/catalog.xml ../_schema/iwxxm/2.0/iwxxm.xsd
# jaxb-ri/bin/xjc.sh -d bindings_with_collect/ -b ../_binding/bindings.xjb -catalog ../_schema/iwxxm/2.1/catalog.xml ../_schema/iwxxm/2.1/iwxxm-collect.xsd
jaxb-ri/bin/xjc.sh -d bindings_with_collect/ -b ../_binding/bindings.xjb ../_schema/iwxxm/2.1/iwxxm-collect.xsd

php refactor.php bindings_with_collect/

# Patch setValue(null) for type in measures.xsd
#cp -p patch_manual/net/opengis/gml/* bindings_with_collect/net/opengis/gml/
