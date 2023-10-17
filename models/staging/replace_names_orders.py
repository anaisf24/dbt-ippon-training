from fuzzywuzzy import process
from fuzzywuzzy import fuzz

def model(dbt, session):

    # setting configuration
    dbt.config(materialized="table"
    , packages=["fuzzywuzzy"])
    
    upstream_model = dbt.ref("flatten_dishes_names").to_pandas()
    upstream_source = dbt.source("source", "dishes").to_pandas()

    def custom_scorer(string):
        x = process.extractOne(string, upstream_source.NAME, score_cutoff=60)
        if x is not None:
            return x[0]
        else:
            return None
    result = upstream_model.assign(new_names=lambda df: df.DISHES_NAMES.apply(custom_scorer))
    return result

