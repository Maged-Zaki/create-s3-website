# create-s3-website

`create-s3-website` is a simple bash script that creates an S3 bucket, enables static web hosting, and uploads website files to the S3 bucket, all using AWS CLI.

## Getting Started

### Prerequisites

1. AWS CLI: [Download AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. AWS CLI profile configured: [Configure AWS CLI profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-user.html)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Maged-Zaki/create-s3-website.git
    ```
2. Navigate to the project directory:
    ```sh
    cd create-s3-website
    ```

3. Ensure your website content is in the `website` directory, following this structure:

    ```bash
    create-s3-website
    └── website
        └── index.html
        └── error.html
        └── js/
        └── css/
    ```

4. Run the script:
    ```bash
    bash create-s3-website.bash <bucket_name> <bucket_region> <default_page> <error_page> <aws_profile>
    ```
5. The URL will be displayed in the terminal as follows:
    ```bash
    ------------------------------
    Bucket URL: http://maged-zaki-bucket.s3-website-eu-west-1.amazonaws.com
    ------------------------------
    ```

