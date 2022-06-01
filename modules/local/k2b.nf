process KRAKEN_DB_DWNLD {


    output:
    path('taxo.k2d')       , optional:false, emit: scaffolds
    path('hash.k2d')       , optional:false, emit: contigs
    path('opts.k2d')       , optional:false, emit: transcripts

    script:
    """
    cd ${baseDir}/assets/databases/kraken2db
    wget -c https://refdb.s3.climb.ac.uk/kraken2-microbial/hash.k2d
    wget https://refdb.s3.climb.ac.uk/kraken2-microbial/opts.k2d
    wget https://refdb.s3.climb.ac.uk/kraken2-microbial/taxo.k2d
    """
}
