process COVERAGE_RATIO {
    tag "$meta.id"
    label 'process_medium'

    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/entrez-direct:16.2--he881be0_0' :
        'quay.io/biocontainers/entrez-direct' }"

    input:

    output:

    script:
    """

    """
