baseCommand: [salmon, quant, --libType, A, --output, salmon.out]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: fastq1
  inputBinding: {prefix: '-1'}
  type: File
- id: fastq2
  inputBinding: {prefix: '-2'}
  type: File
- id: index
  inputBinding: {prefix: -i}
  type: Directory
outputs:
- id: outfile
  outputBinding: {glob: salmon.out/quant.sf}
  type: File
requirements:
- {class: DockerRequirement, dockerPull: combinelab/salmon}
