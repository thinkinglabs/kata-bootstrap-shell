#shellspec shell=bash

Describe 'hello_world'
  Include ./bin/hello_world2

  # mock date command to compare log lines
  date() { echo "2024-12-10 08:31:11"; }

  Describe 'main'
    usage() { %text
      #|
      #|says hello
      #|
      #|usage: bash --name <name>
      #|
      #|  --name	A name to say hello to.
      #|
      #|the following environment variables should be present:
      #|
      #|  none
    }
    Context '<name> is undefined'
      It 'fails'
        expected_stderr() { %text
          #|2024-12-10 08:31:11 [ERROR] [bash] The value for '--name' cannot be empty
        }

        When run main
        The output should eq "$(usage)"
        The stderr should eq "$(expected_stderr)"
        The status should be failure
      End 
    End

    Context '--name is defined'
      say_hello() { echo "$@"; }
      It 'succeeds'
        When run main --name "Lily"
        The output should eq "Lily"
        The status should be success
      End
    End

    Context 'missing --name value'
      It 'fails'
        expected_stderr() { %text
          #|2024-12-10 08:31:11 [ERROR] [bash] The value for '--name' cannot be empty
        }

        When run main
        The output should eq "$(usage)"
        The stderr should eq "$(expected_stderr)"
        The status should be failure
      End
    End
  End

  Describe 'say_hello'
    It 'prints hello'
      When call say_hello "Lily"
      The output should eq "Hello, Lily!"
    End
  End
End
