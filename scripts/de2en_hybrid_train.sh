DATA=wmt20_bio_deen
DATA_BIN=
CHECKPOINT_DIR=
EVAL_OUTPUT_PATH=

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python train.py $DATA_BIN \
  -s de -t en \
  --encoder-layers 40 \
  --encoder-normalize-before \
  --decoder-normalize-before \
  --lr 0.0007 --min-lr 1e-09 \
  --weight-decay 0.0 --clip-norm 0.1 \
  --max-tokens 8192 \
  --update-freq 1 \
  --arch san_on_lstm_hybrid \
  --optimizer adam --adam-betas '(0.9, 0.98)' \
  --lr-scheduler inverse_sqrt \
  --warmup-init-lr 1e-07 \
  --warmup-updates 8000 \
  --save-dir $CHECKPOINT_DIR \
  --tensorboard-logdir ./results/$DATA/logs \
  --criterion label_smoothed_cross_entropy \
  --label-smoothing 0.1 \
  --no-progress-bar \
  --log-format simple \
  --log-interval 100 \
  --save-interval-updates 1000 \
  --max-update 400000 \
  --max-epoch 100 \
  --beam 1 \
  --remove-bpe \
  --quiet \
  --all-gather-list-size 522240 \
  --num-ref $DATA=1 \
  --valid-decoding-path $EVAL_OUTPUT_PATH \
  --multi-bleu-path ./scripts/ \
  --fp16 \
  --save-interval 1 \
  --keep-interval-updates 5 \
  --keep-last-epochs 10 \
  |& tee ./results/$DATA/logs/train.log

  
