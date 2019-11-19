# VOT Corpora

This package collects a number of small VOT corpora from different sources:

* Baese-Berk & Goldrick (2009) experiment 1 measured voice onset time for
  monosyllabic words with word-initial voiceless stops. Some words had voiced
  minimal pair, while others did not. Words were read in isolation with other
  monosyllabic fillers that did not have initial stops. Experiment 1a only had
  /p/-initial words, and Experiment 1b had /t/ and /k/.  Supported by National
  Institutes of Health Grant DC0079772

* Goldrick, Vaughn, & Murphy (2013), experiment 1 is analogous to Baese-Berk &
  Goldrick (2009) but with voiced stops.  Supported by National Science
  Foundation Grant BCS0846147

* Allen & Miller (1999). Experiment 1 measured VOTs for voiced and voiceless
  stops in monosyllabic words. Experiment 2 included a subset of word pairs from
  Experiment 1 as well as the additional manipulation of speaking rate (fast and
  slow).  This dataset also includes measurements of the word-final stop
  consonants (vowel length, closure duration, and aspiration duration).  This
  research was supported by NIH Grant DC00130 from the National Institute on
  Deafness and Other Communication Disorders and by a Minority Fellowship from
  the Acoustical Society of America.

* Lev-Ari, S., & Peperkamp, S. (2013). English-French bilinguals (English L1)
  read 16 sentences, 10 of which contained one word each starting with /p/, /t/,
  and /k/. (Items are the English sentences from Fowler, Sramkoc, Ostrya,
  Rowlanda, & Halle, 2008). A subset of the talkers also conducted interviews,
  from which VOTs of all word-initial voiceless stops were measured.  Supported
  by Fondation Pierre-Gilles de Gennes and Agence Nationale de la Recherche
  (ANR-2010-BLAN-1901, ANR-10-LABX-0087 and ANR-10-IDEX-0001-02).

* Buckeye (Nelson, N. & Wedel, A., _e-pub ahead of print_). VOTs
  automatically annotated from word-initial voice and voiceless stops in the
  Buckeye Corpus of conversational speech by Andy Wedel and Noah Nelson.  Age is
  coded as old (40+) or young (under 40).  Includes stop length and local speech
  rate information, but no pre-voiced tokens.


The first three are from isolated word list reading, the fourth from sentences and
conversational speech and the fifth from conversational speech. All are from
English monolinguals except for the Lev-Ari data, which is from L1 English, L2
French speakers who live in France and speak French primarily. The Buckeye,
Lev-Ari, and Goldrick et al. (2013) have speaker sex coded, and Buckeye and
Lev-Ari have age (Buckeye only as older/younger than 40).

__The only corpora that have both voiced and voiceless stops for each talker are the
Buckeye and Allen & Miller data.__

# Installation

```r
devtools::install_github("kleinschmidt/votcorpora", build_vignettes=TRUE)
```

# Usage

``` r
library(votcorpora); vot
#> # A tibble: 15,342 x 19
#>    source subject phoneme   vot prevoiced word  sex     age age_group
#>    <chr>  <chr>   <fct>   <dbl> <lgl>     <chr> <chr> <dbl> <chr>    
#>  1 levar… la_1    k          52 NA        keep… f        47 o        
#>  2 levar… la_1    k          42 NA        cove… f        47 o        
#>  3 levar… la_1    k          75 NA        carr… f        47 o        
#>  4 levar… la_1    k          54 NA        cavi… f        47 o        
#>  5 levar… la_1    k          57 NA        kate  f        47 o        
#>  6 levar… la_1    k          58 NA        car   f        47 o        
#>  7 levar… la_1    k          50 NA        comf… f        47 o        
#>  8 levar… la_1    k          54 NA        Kayla f        47 o        
#>  9 levar… la_1    k          61 NA        call… f        47 o        
#> 10 levar… la_1    k          55 NA        caug… f        47 o        
#> # … with 15,332 more rows, and 10 more variables: bilingual <lgl>,
#> #   speech_rate <dbl>, stop_length <dbl>, vowel_duration <dbl>,
#> #   final_phoneme <fct>, final_closure <dbl>, final_aspiration <dbl>,
#> #   speech_rate_condition <fct>, voicing <fct>, place <fct>
```

See the vignette for more details.

## Data format

See the help page:

``` r
library(votcorpora)
?vot
#> vot                 package:votcorpora                 R Documentation
#> 
#> Combined VOT production data
#> 
#> Description:
#> 
#>      Word initial VOT measurements from four different production
#>      experiments. Two are isolated word reading, one is sentence
#>      reading, and one is conversational speech from interviews.
#> 
#> Usage:
#> 
#>      vot
#>      
#> Format:
#> 
#>      A data frame with 14,262 observations of 12 variables:
#> 
#>      source The source of this observation
#> 
#>      subject ID of the talker that produced this observation
#> 
#>      phoneme Phoneme whose VOT was measured
#> 
#>      final_phoneme Final phoneme in the word (‘allen-miller’ only; all
#>           voiced/voiceless stops)
#> 
#>      vot Voice onset time in ms
#> 
#>      vowel_duration Duration of the following vowel in ms
#> 
#>      final_closure Closure duration of final stop (‘allen-miller’
#>           only).
#> 
#>      final_aspiration Duration of release burst of final stop
#>           (‘allen-miller’ only).
#> 
#>      prevoiced For voiced stops, TRUE if prevoicing was present, FALSE
#>           if not. NA for voiceless stops
#> 
#>      word Word that the phoneme occurred in
#> 
#>      sex The sex of the talker ('m' or 'f'), NA if missing (‘bbg09’).
#> 
#>      age The age of the talker, NA if missing (‘bbg09’ and ‘gva13’).
#> 
#>      age_group The age group of the talker ('o' for over 40, and 'y'
#>           for under 30; based on the Buckeye Corpus scheme).
#> 
#>      bilingual TRUE for French-English bilinguals, FALSE for english
#>           monolinguals
#> 
#>      speech_rate The local speech rate (for Buckeye only) in syllables
#>           per second. This is calculated based on the number of vowels
#>           in the continuous speech window around the word where VOT was
#>           extracted.
#> 
#>      speech_rate_condition Allen & Miller (1999) elicited slow and fast
#>           speech rates in their Experiment 2 by varying the
#>           instructions and the time that the word was displayed (1500ms
#>           for the "slow" rate, and 750ms for the "fast" rate).
#> 
#>      stop_length The length of the whole stop, from burst to following
#>           sonorant onset (Buckeye only), in ms.
#> 
#>      voicing Is the phoneme ‘voiced’ or ‘voiceless’.
#> 
#>      place Place of articulation. ‘cor’ for coronal, ‘lab’ for labial,
#>           and ‘dor’ for dorsal.
#> 
#> Details:
#> 
#>      The sources are
#> 
#>      bbg09 Baese-Berk & Goldrick (2009), experiment 1 measured voice
#>           onset time for monosyllabic words with word-initial voiceless
#>           stops. Some words had voiced minimal pair, while others did
#>           not. Words were read in isolation with other monosyllabic
#>           fillers that did not have initial stops. Experiment 1a only
#>           had /p/-initial words, and Experiment 1b had /t/ and /k/.
#> 
#>      gva13 Goldrick, Vaughn, & Murphy (2013), experiment 1 is analogous
#>           to ‘bbg09’ but with voiced stops.
#> 
#>      allen-miller Allen & Miller (1999). Experiment 1 was similar to
#>           ‘gva13’ and measured VOTs for voiced and voiceless stops in
#>           monosyllabic words from . Experiment 2 was the same as
#>           Experiment 1 but included the additional manipulation of
#>           speaking rate (fast and slow). Prevoiced stops are coded as
#>           NA. Since all words were monosyllabic with a final stop
#>           consonant, the stop consonant phoneme is included
#>           (‘final_phoneme’), as is the measurements of closure and
#>           aspiration duration (‘final_closure’ and ‘final_aspiration’).
#> 
#>      levari-sent Lev-Ari, S., & Peperkamp, S. (2013). English-French
#>           bilinguals (English L1) read 16 sentences, 10 of which
#>           contained one word each starting with /p/, /t/, and /k/.
#>           (Items are the English sentences from Fowler, Sramkoc,
#>           Ostrya, Rowlanda, & Halle, 2008)
#> 
#>      levari-convo A subset of the talkers from ‘levari-sent’ conducted
#>           interviews, from which VOTs of all word-initial voiceless
#>           stops were measured.
#> 
#>      buckeye Nelson, Noah & Wedel, Andrew (under revision).  The
#>           phonetic specificity of competition: Contrastive
#>           hyperarticulation of voice onset time in conversational
#>           English.  VOTs manually extracted from the Buckeye Corpus of
#>           conversational speech by Andy Wedel. Age is coded as old
#>           (40+) or young (under 40).  Includes two measures of local
#>           speech rate, syllables per second and total stop length.
#> 
#> 

```

## Citations

This package contains citation information for each source.  **Please cite the
appropriate entry here** if you use data contained in this package for a paper.

To get this within R:

``` r
citation("votcorpora")
#>
#>   Goldrick, M., Vaughn, C., & Murphy, A. (2013). The effects of
#>   lexical neighbors on stop consonant articulation. The Journal of
#>   the Acoustical Society of America, 134(2), EL172-7.
#>   https://doi.org/10.1121/1.4812821
#>
#>   Baese-Berk, M., & Goldrick, M. (2009). Mechanisms of interaction
#>   in speech production. Language and Cognitive Processes, 24(4),
#>   527–554. https://doi.org/10.1080/01690960802299378
#>
#>   Allen, J S, Miller, J L (1999). Effects of syllable-initial
#>   voicing and speaking rate on the temporal characteristics of
#>   monosyllabic words. The Journal of the Acoustical Society of
#>   America. 1999;106(4):2031-2039.
#>   https://doi:10.1121/1.427949
#>
#>   Nelson, N. R., & Wedel, A. (2017). The phonetic specificity of
#>   competition: Contrastive hyperarticulation of voice onset time
#>   in conversational English. Journal of Phonetics, e-pub, 1–20.
#>   https://doi.org/10.1016/j.wocn.2017.01.008
#>
#>   Lev-Ari, S., & Peperkamp, S. (2013). Low inhibitory skill leads
#>   to non-native perception and production in bilinguals’ native
#>   language. Journal of Phonetics, 41(5), 320–331.
#>   https://doi.org/10.1016/j.wocn.2013.06.002
#>
#>
#> To see these entries in BibTeX format, use 'print(<citation>,
#> bibtex=TRUE)', 'toBibtex(.)', or set
#> 'options(citation.bibtex.max=999)'.
```

# Want to make your own data package?

I (Dave) accept data donations!  Please email me, or follow [my
tutorial](http://www.davekleinschmidt.com/r-packages/) if you want to package
your own data (it's easier than you think!).
