#' Combined VOT production data
#'
#' Word initial VOT measurements from four different production experiments. Two
#' are isolated word reading, one is sentence reading, and one is conversational
#' speech from interviews.
#'
#' The sources are
#' \describe{
#' 
#' \item{bbg09}{Baese-Berk & Goldrick (2009), experiment 1 measured voice onset
#'   time for monosyllabic words with word-initial voiceless stops. Some words
#'   had voiced minimal pair, while others did not. Words were read in isolation
#'   with other monosyllabic fillers that did not have initial stops. Experiment
#'   1a only had /p/-initial words, and Experiment 1b had /t/ and /k/.}
#'
#' \item{gva13}{Goldrick, Vaughn, & Murphy (2013), experiment 1 is analogous to
#'   \code{bbg09} but with voiced stops.}
#'
#' \item{levari-sent}{Lev-Ari, S., & Peperkamp, S. (2013). English-French
#'   bilinguals (English L1) read 16 sentences, 10 of which contained one word
#'   each starting with /p/, /t/, and /k/. (Items are the English sentences from
#'   Fowler, Sramkoc, Ostrya, Rowlanda, & Halle, 2008)}
#'
#' \item{levari-convo}{A subset of the talkers from \code{levari-sent} conducted
#'   interviews, from which VOTs of all word-initial voiceless stops were
#'   measured.}
#'
#' \item{buckeye}{VOTs extracted from the Buckeye Corpus of conversational
#'   speech by Andy Wedel. Age is coded as old (over 40) or young (under 30).}
#' 
#' }
#' 
#'
#' @format A data frame with NNN observations of NNN variables:
#' \describe{
#' \item{source}{The source of this observation}
#' \item{subject}{ID of the talker that produced this observation}
#' \item{phoneme}{Phoneme whose VOT was measured}
#' \item{vot}{Voice onset time in ms}
#' \item{prevoiced}{For voiced stops, TRUE if prevoicing was present, FALSE if
#'   not. NA for voiceless stops}
#' \item{word}{Word that the phoneme occurred in}
#' \item{sex}{The sex of the talker ('m' or 'f'), NA if missing (\code{bbg09}).}
#' \item{age}{The age of the talker, NA if missing (\code{bbg09} and
#'   \code{gva13}).}
#' \item{age_group}{The age group of the talker ('o' for over 40, and 'y' for
#'   under 30; based on the Buckeye Corpus scheme).}
#' \item{bilingual}{TRUE for French-English bilinguals, FALSE for english
#'   monolinguals}
#' }
"vot"
