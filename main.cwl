class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': kellrott@synapse.org,
  'foaf:name': kellrott}
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: convert/outfile, type: File}
steps:
- id: convert
  in:
  - {id: infile, source: salmon/outfile}
  out: [outfile]
  run: convert.cwl
- id: salmon
  in:
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {id: index, source: tar/outfile}
  out: [outfile]
  run: salmon.cwl
- id: tar
  in:
  - {id: infile, source: index}
  out: [outfile]
  run: tar.cwl
