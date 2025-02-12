CUDA_VISIBLE_DEVICES=0,1 accelerate launch --multi_gpu --num_processes=2 --main_process_port 29500 train_lsd.py \
--enable_xformers_memory_efficient_attention --dataloader_num_workers 2 --learning_rate 1e-4 \
--mixed_precision fp16 --num_validation_images 32 --val_batch_size 32 --max_train_steps 50000 \
--checkpointing_steps 5000 --checkpoints_total_limit 2 --gradient_accumulation_steps 1 \
--seed 42 --encoder_lr_scale 1.0 --train_split_portion 0.9 \
--dataset_name celeba \
--output_dir /home/wei/LSD/runs/celeba/ \
--backbone_config configs/celeba/backbone/config.json \
--slot_attn_config configs/celeba/slot_attn/config.json \
--unet_config configs/celeba/unet/config.json \
--scheduler_config configs/celeba/scheduler/scheduler_config.json \
--dataset_root /home/wei/LSD/data_raw/ \
--dataset_glob '**/*.png' --train_batch_size 128 --resolution 128 --validation_steps 5000 \
--tracker_project_name latent_slot_diffusion