# Makefile generated by OCamake
# http://tech.motion-twin.com
.SUFFIXES : .ml .mli .cmo .cmx .cmi .mll .mly

INSTALLDIR=`ocamlc -where`
CFLAGS=
LFLAGS= -pack
LIBS=

all: xml_light.cma test.exe doc

opt: xml_light.cmxa test_opt.exe
	ocamlbuild -no-hygiene xml_light.cmxs

install: all opt
	ocamlfind install xml-light META xml_light.cmxa xml_light.cmi xml_light.cma xml.mli xmlParser.mli dtd.mli xml.cmx dtd.cmx xmlParser.cmx _build/xml_light.cmxs


uninstall:
	ocamlfind remove xml-light

doc:
	mkdir doc
	ocamldoc -sort -html -d doc xml.mli dtd.mli xmlParser.mli

test.exe: xml_light.cma
	ocamlc xml_light.cma test.ml -o test.exe

test_opt.exe: xml_light.cmxa
	ocamlopt xml_light.cmxa test.ml -o test_opt.exe

xml_light.cma: xml_parser.cmo xml_lexer.cmo dtd.cmo xmlParser.cmo xml.cmo
	ocamlc -o xml_light.cma $(LFLAGS) $(LIBS) xml_parser.cmo xml_lexer.cmo dtd.cmo xmlParser.cmo xml.cmo

xml_light.cmx: xml_parser.cmx xml_lexer.cmx dtd.cmx xmlParser.cmx xml.cmx
	ocamlopt -o xml_light.cmx $(LFLAGS) $(LIBS) xml_parser.cmx xml_lexer.cmx dtd.cmx xmlParser.cmx xml.cmx

xml_light.cmxa: xml_light.cmx
	ocamlopt -a -o xml_light.cmxa xml_light.cmx

dtd.cmo: xml.cmi xml_lexer.cmi dtd.cmi

dtd.cmx: xml.cmi xml_lexer.cmi dtd.cmi

xml.cmo: dtd.cmi xmlParser.cmi xml_lexer.cmi xml.cmi

xml.cmx: dtd.cmi xmlParser.cmi xml_lexer.cmi xml.cmi

xmlParser.cmo: dtd.cmi xml.cmi xml_lexer.cmi xmlParser.cmi

xmlParser.cmx: dtd.cmi xml.cmi xml_lexer.cmi xmlParser.cmi

dtd.cmi: xml.cmi

xml.cmi:

xmlParser.cmi: dtd.cmi xml.cmi

xml_lexer.cmi: dtd.cmi

xml_parser.cmo: xml_parser.ml dtd.cmi xml_parser.mli xml_parser.cmi

xml_parser.cmx: xml_parser.ml dtd.cmi xml_parser.mli xml_parser.cmi

xml_lexer.cmo: xml_lexer.ml xml_lexer.cmi

xml_lexer.cmx: xml_lexer.ml xml_lexer.cmi

clean:
	rm -f xml_light.cma test.exe dtd.cmo dtd.cmi test.cmo test.cmi xml.cmo xml.cmi xmlParser.cmo xmlParser.cmi dtd.cmi xml.cmi xmlParser.cmi xml_lexer.cmi xml_lexer.cmo xml_lexer.ml xml_parser.mli xml_parser.cmi xml_parser.ml xml_parser.cmo
	rm -f xml_light.lib xml_light.a xml-light.cmxa test_opt.exe dtd.cmx dtd.obj dtd.o test.cmx test.obj test.o xml.cmx xml.obj xml.o xmlParser.cmx xmlParser.obj xmlParser.o xml_lexer.cmx xml_lexer.obj xml_lexer.o xml_parser.cmx xml_parser.obj xml_parser.o

wclean:
	-@del xml-light.cma test.exe dtd.cmo dtd.cmi test.cmo test.cmi xml.cmo xml.cmi xmlParser.cmo xmlParser.cmi dtd.cmi xml.cmi xmlParser.cmi xml_lexer.cmi xml_lexer.cmo xml_lexer.ml xml_parser.mli xml_parser.cmi xml_parser.ml xml_parser.cmo 2>NUL
	-@del xml_light.lib xml_light.a xml-light.cmxa test_opt.exe dtd.cmx dtd.obj dtd.o test.cmx test.obj test.o xml.cmx xml.obj xml.o xmlParser.cmx xmlParser.obj xmlParser.o xml_lexer.cmx xml_lexer.obj xml_lexer.o xml_parser.cmx xml_parser.obj xml_parser.o 2>NUL

# SUFFIXES
.ml.cmo:
	ocamlc $(CFLAGS) -c $<

.ml.cmx:
	ocamlopt $(CFLAGS) -for-pack Xml_light -c $<

.mli.cmi:
	ocamlc $(CFLAGS) $<

.mll.ml:
	ocamllex $<

.mly.ml:
	ocamlyacc $<

