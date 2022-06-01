process TOP_ANI {
    tag "$meta.id"
    label 'process_low'

    input:
    tuple val(meta), path(mashed)

    output:
    tuple val(meta), path("*_mash_sorted.txt")       , emit: top_matches
    tuple val(meta), path("*_sorted.txt")           , emit: _sorted
    tuple val(meta), path("*.txt")             , emit: full_list

    script:
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    sort \\
    -k3 \\
    -r \\
    -o ${prefix}.txt > ${prefix}_sorted.txt

    head --lines 20 | cut -d "\t" -f3 ${prefix}.txt  > ${prefix}_mash_sorted.txt
    """
}
