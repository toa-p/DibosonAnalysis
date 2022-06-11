ALL_SUBSYSTEMS+=PhysicsTools
subdirs_src_PhysicsTools = src_PhysicsTools_NanoAODTools
ALL_PACKAGES += PhysicsTools/NanoAODTools
subdirs_src_PhysicsTools_NanoAODTools := src_PhysicsTools_NanoAODTools_data src_PhysicsTools_NanoAODTools_python src_PhysicsTools_NanoAODTools_scripts src_PhysicsTools_NanoAODTools_src
ifeq ($(strip $(PyPhysicsToolsNanoAODTools)),)
PyPhysicsToolsNanoAODTools := self/src/PhysicsTools/NanoAODTools/python
src_PhysicsTools_NanoAODTools_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysicsTools/NanoAODTools/python)
PyPhysicsToolsNanoAODTools_files := $(patsubst src/PhysicsTools/NanoAODTools/python/%,%,$(wildcard $(foreach dir,src/PhysicsTools/NanoAODTools/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyPhysicsToolsNanoAODTools_LOC_USE := self  
PyPhysicsToolsNanoAODTools_PACKAGE := self/src/PhysicsTools/NanoAODTools/python
ALL_PRODS += PyPhysicsToolsNanoAODTools
PyPhysicsToolsNanoAODTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysicsToolsNanoAODTools,src/PhysicsTools/NanoAODTools/python,src_PhysicsTools_NanoAODTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysicsToolsNanoAODTools,src/PhysicsTools/NanoAODTools/python))
endif
ALL_COMMONRULES += src_PhysicsTools_NanoAODTools_python
src_PhysicsTools_NanoAODTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_NanoAODTools_python,src/PhysicsTools/NanoAODTools/python,PYTHON))
src_PhysicsTools_NanoAODTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/PhysicsTools/NanoAODTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_PhysicsTools_NanoAODTools_scripts,src/PhysicsTools/NanoAODTools/scripts,$(SCRAMSTORENAME_BIN),*))
