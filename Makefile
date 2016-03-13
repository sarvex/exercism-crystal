# assignments
ASSIGNMENT ?= ""
IGNOREDIRS := "^(\.git|docs)$$"
EXERCISESDIR ?= "exercises"
ASSIGNMENTS = $(shell find exercises -maxdepth 1 -mindepth 1 -type d | cut -d'/' -f2 | sort | grep -Ev $(IGNOREDIRS))

# output directories
TMPDIR ?= "/tmp"
OUTDIR := $(shell mktemp -d "$(TMPDIR)/$(ASSIGNMENT).XXXXXXXXXX")

# language specific config (tweakable per language)
FILEEXT := "cr"
EXAMPLE := "example.$(FILEEXT)"
TESTNAME := "$(subst -,_,$(ASSIGNMENT))"
SPECFILE := "$(TESTNAME)_spec.$(FILEEXT)"
TESTFILE := "$(TESTNAME).$(FILEEXT)"

test-assignment:
	@echo "running tests for: $(ASSIGNMENT)"
	@echo "testname: $(TESTNAME)"
	@echo "$(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECFILE) -> $(OUTDIR)"
	@echo "$(EXERCISESDIR)/$(ASSIGNMENT)/$(EXAMPLE) -> $(OUTDIR)/$(TESTFILE)"
	@echo "crystal spec $(OUTDIR)/$(SPECFILE)"
	@cp $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECFILE) $(OUTDIR)
	@cp $(EXERCISESDIR)/$(ASSIGNMENT)/$(EXAMPLE) $(OUTDIR)/$(TESTFILE)
	# @sed -i.original 's/\bxit\b/it/g' $(OUTDIR)/*spec.$(FILEEXT)
	# @sed "s/\.\/$(ASSIGNMENT)/$(ASSIGNMENT)/g" $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECFILE) > $(OUTDIR)/$(SPECFILE)
	# @sed 's/pending/it/g' $(EXERCISESDIR)/$(ASSIGNMENT)/$(SPECFILE) > $(OUTDIR)/$(SPECFILE)
	@cd $(OUTDIR) && crystal spec $(SPECFILE)

test:
	@for assignment in $(ASSIGNMENTS); do ASSIGNMENT=$$assignment $(MAKE) -s test-assignment || exit 1; done
