## outdir
try:
    results = config["outdir"]
except:
    config["outdir"] = "results"
    results = config["outdir"]


## verbose
try:
    verbose = config["verbose"]
except:
    verbose = False


## ora ext
try:
    config["ora_ext"]
except:
    config["ora_ext"] = ".fastq.ora"


## sample whitelist
try:
    config["whitelist"]
except:
    config["whitelist"] = None


## sample blacklist
try:
    config["blacklist"]
except:
    config["blacklist"] = None


## bnames (from ora)
config["ora"] = {}
try:
    for filepath in glob.glob(config["indir"]+"/**/*"+config["ora_ext"], recursive=True):
        basename = os.path.basename(filepath)
        file = re.sub(config["ora_ext"]+"$", "", basename)
        
        ##config["ora"][file] = filepath

        if config["whitelist"]:
            if file in config["whitelist"]:
                config["ora"][file] = filepath
        else:
            config["ora"][file] = filepath

        if config["blacklist"]:
            if file in config["blacklist"]:
                config["ora"].pop(file, None) # remove blacklist key
except:
    pass
oras = sorted(config["ora"].keys())
    
