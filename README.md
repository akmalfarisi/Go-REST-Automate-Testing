# API Testing with Robot Framework

This project demonstrates how to perform API testing using Robot Framework. It includes test cases for interacting with the REST API provided by [GoRest](https://gorest.co.in/).

## Description

The tests are organized into three main files:

- `keywords.robot`: Contains custom keywords for interacting with the API.
- `ExcelLibrary.py`: A Python library used to read data from an Excel file.
- `test_cases.robot`: Contains the test cases.

## Prerequisites

To run the tests, you need to have the following installed:

- Robot Framework
- RequestsLibrary
- OpenPyXL

## Setup

1. Clone this repository to your local machine.
2. Install the required dependencies using pip:

   ```
   pip install robotframework requests openpyxl
   ```

3. Update the `base_url` variable in `keywords.robot` with your GoRest API URL.
4. Generate an access token for the GoRest API. Follow the steps in the [Generating Access Token](#generating-access-token) section below.
5. Update the `token` variable in `keywords.robot` with the generated access token.
6. Prepare an Excel file with user data for testing. The file should have columns for `name`, `email`, `gender`, and `status`.

## Generating Access Token

To generate an access token for the GoRest API, follow these steps:

1. Sign up or log in to your GoRest account at [GoRest](https://gorest.co.in/).
2. Once logged in, navigate to your account settings or developer settings.
3. Look for an option to generate API tokens or access tokens.
4. Generate a new access token and copy it to your clipboard.
5. Update the `token` variable in the `keywords.robot` file with the generated access token.

Ensure that you keep your access token secure and do not share it publicly.

## Excel Data

The project includes an Excel file named `input_data.xlsx`. This file contains sample user data used for testing purposes. Ensure that the Excel file follows the required format with columns for `name`, `email`, `gender`, and `status`.

Feel free to modify this file or replace it with your own data for testing.

## Usage

To run the tests:

```
robot test_cases.robot
```

## Test Cases

- **Get User Details**: Retrieves user details by name.
- **Create Users From Excel**: Creates users by reading data from an Excel file.
- **Show User Lists**: Retrieves a list of users.

## Contributing

Contributions are welcome! If you find any issues or want to add new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to customize this template according to your project's specific needs. It's important to provide clear instructions on how to set up and use the project, as well as any relevant information for potential contributors.