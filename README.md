# WMT2020_BioMedical_MT 
	http://www.statmt.org/wmt20/biomedical-translation-task.html

The Tencent AI Lab participated in the WMT20 Shared Task on Biomedical Translation in four language directions: German<->English, Chinese<->English. Our systems in German->Enlgish and English-> German were ranked 1st and 3rd respectively according to the [automatic evaluation](https://drive.google.com/file/d/116eQudN5rNx9-VYru5lFy0lT1IMqp7kP/view).

## Data and Pre-trained models 

### Data provided by organizers
| No. | Corpus                             | File                          | En-Zh  | En-De | En |
| --- | :---:                              | :---:                         | :---: | :---:  | :---:  |
| 1   | Biomedical Translation             | wmt18/Medline/training/es-en | n/a    | n/a    | 287811 |
|     |                                    | wmt18/Medline/training/fr-en | n/a    | n/a    | 627576 |
|     |                                    | wmt18/Medline/training/pt-en | n/a    | n/a    |  74645 |
|     |                                    | wmt18/Medline/test  | -     | -      | - |
|     |                                    | wmt19/Medline/training/de-en| n/a   | 40398  |  40398 |
|     |                                    | wmt19/Medline/training/fr-en| n/a   |  n/a   |  75049 |
|     |                                    | wmt19/Medline/training/es-en| n/a   |  n/a   | 100257 |
|     |                                    | wmt19/Medline/training/pt-en| n/a   |  n/a   |  49918 |
|     |                                    | wmt19/Medline/test/Medline  | -     | -      | -      |
|     |                                    | wmt20/Medline/training/it-en| n/a   |  n/a   |  14756 |
|     |                                    | wmt20/Medline/training/ru-en| n/a   |  n/a   |  46782 |
| 2   | UFAL Medical Corpus                | shuffled.de-en                | n/a  | 37814533 | n/a |
| 3   | HimL test sets                     | khresmoi-summary-dev          | n/a  | 500      | n/a |
|     |                                    | khresmoi-summary-test         | n/a  | 1000     | n/a |
| 4   | Khresmoi development data          | himl-test-2015/cochrane       | n/a  | 1433     | n/a |
|     |                                    | himl-test-2015/himl           | n/a  | 3892     | n/a | 
|     |                                    | himl-test-2015/nhs24          | n/a  | 2459     | n/a | 
|     |                                    | himl-test-2017/cochrane       | n/a  | 467      | n/a | 


### Model hyperparameters
|                | Deep Transformer   | Hybrid Transformer  | Big Transformer       | Large Transformer  |
| ---            | :---:   | :---:       | :---:     | :---:  | 
|Encoder Layer   |   40    |    40       |    6      |  20    |
|Decoder Layer   |   6     |    6        |    6      |  6     |
|Attention Heads |   8     |    8        |    16     |  16    |
|Embedding Size  |   512   |    512      |    1024   |  1024  |
|FFN Size        |   2048  |    2048     |    4096   |  4096  |

### Pre-trained models 
|                | Deep Transformer   | Hybrid Transformer  | Big Transformer       | Large Transformer  |
| ---            | :---:   | :---:       | :---:     | :---:  | 
|De->En          |   [download](https://drive.google.com/file/d/1Fe0tIBbsdutUVZS9QHJWNWB29ZxpaapN/view?usp=sharing)    |    [download](https://drive.google.com/file/d/1g7HYSenbEeoeN3xDfm1cmSCF-TLJPl_X/view?usp=sharing)       |    [download](https://drive.google.com/file/d/1W7v7NI0a7QCwxLg7BgqRunDsPVW2sN4H/view?usp=sharing)      |  [download](https://drive.google.com/file/d/1sqCNoa6srntduEeUwg5qo5auZKCvfElK/view?usp=sharing)    |
|En->De          |   [download]()    |    [download]()       |    [download]()      |  [download]()   |

BPE Model: [De-En BPE models](https://drive.google.com/file/d/1MM7U5bbSp1HW1iIi7WXqTmRcVZtgNGvC/view?usp=sharing)


### Synthetic Chinese-English bilingual data
[Chinese-English Biomedical bilingual data]()

## Training Details
### Data Preprocessing
[Moses scripts](https://github.com/moses-smt/mosesdecoder/tree/master/scripts/tokenizer)

lang: en/Enlgish de/German

#Step1. normalize-punctuation
./mosesdecoder-master/scripts/tokenizer/normalize-punctuation.perl -l lang < data.de > data.lang.norm

#Step2. remove-non-printing-char
./mosesdecoder-master/scripts/tokenizer/remove-non-printing-char.perl < data.lang.norm > data.lang.norm.remv

#Step3. tokenize
./mosesdecoder-master/scripts/tokenizer/tokenizer.perl -l lang -threads 10 < data.lang.norm.remv > data.lang.norm.remv.tok

#Step4. 

### Baseline
#### Model:    Transformer
#### Toolkit:  Fairseq




