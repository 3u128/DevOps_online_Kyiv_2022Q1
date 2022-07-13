## Module 2 Virtualization and Cloud Basic
### Task 2.2

**Create a snapshot of your instance to keep as a backup**

![snapshot](https://raw.githubusercontent.com/3u128/DevOps_online_Kyiv_2022Q1/main/m2/task2.2/snapshot.png)

**Create and attach a Disk_D (EBS) to your instance to add more storage space.**
**Create and save some file on Disk_D.**

![reattach_disk_d](https://raw.githubusercontent.com/3u128/DevOps_online_Kyiv_2022Q1/main/m2/task2.2/reattach_disk_d.png)

![add_volume_and_write_file](https://raw.githubusercontent.com/3u128/DevOps_online_Kyiv_2022Q1/main/m2/task2.2/add_volume_and_write_file.png)

![bucket_s3](https://raw.githubusercontent.com/3u128/DevOps_online_Kyiv_2022Q1/main/m2/task2.2/bucket_s3.png)


**Review the 10-minute example Batch upload files to the cloud to Amazon S3 using the AWS CLI.**  
**Create a user AWS IAM, configure CLI AWS and upload any files to S3.**  

aws configure  
add some cred-ls from aws console  
work by commands:  

```
# aws s3 cp s3://task2-2-12 task2.2-12
# aws s3 ls s3://task2-2-12
# aws s3 cp task2.2-12 s3://task2-2-12
upload: ./task2.2-12 to s3://task2-2-12/task2.2-12
# aws s3 ls s3://task2-2-12
2022-02-22 09:39:27          0 task2.2-12
```