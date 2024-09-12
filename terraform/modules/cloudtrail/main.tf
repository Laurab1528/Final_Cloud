   resource "aws_cloudtrail" "main" {
     name                          = "main-trail"
     s3_bucket_name                = aws_s3_bucket.cloudtrail.id
     include_global_service_events = true

     event_selector {
       read_write_type           = "All"
       include_management_events = true
     }
   }

   resource "aws_s3_bucket" "cloudtrail" {
     bucket        = "my-cloudtrail-bucket"
     force_destroy = true
   }

   resource "aws_s3_bucket_policy" "cloudtrail" {
     bucket = aws_s3_bucket.cloudtrail.id
     policy = jsonencode({
       Version = "2012-10-17"
       Statement = [
         {
           Sid    = "AWSCloudTrailAclCheck"
           Effect = "Allow"
           Principal = {
             Service = "cloudtrail.amazonaws.com"
           }
           Action   = "s3:GetBucketAcl"
           Resource = aws_s3_bucket.cloudtrail.arn
         },
         {
           Sid    = "AWSCloudTrailWrite"
           Effect = "Allow"
           Principal = {
             Service = "cloudtrail.amazonaws.com"
           }
           Action   = "s3:PutObject"
           Resource = "${aws_s3_bucket.cloudtrail.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
           Condition = {
             StringEquals = {
               "s3:x-amz-acl" = "bucket-owner-full-control"
             }
           }
         }
       ]
     })
   }