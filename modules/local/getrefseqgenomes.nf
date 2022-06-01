process GET_REFS {
    tag "$meta.id"
    label 'process_medium'

    input:
    tuple val(meta), path(ref_ids)

    output:
    tuple val(meta), path(ftp_folder.txt)         , emit: ref_genomes
    path(ftp_folder.txt)                          , emit: ref_paths

    script:
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_refseq.txt
    awk 'BEGIN{FS=OFS="/";filesuffix="genomic.fna.gz"}{ftpdir=$0;asm=$10;file=asm"_"filesuffix;print "wget "ftpdir,file}' ${prefix}_ftp_folder.txt
    """
}
