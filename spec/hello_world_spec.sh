#shellspec shell=bash

Describe 'hello_world'
  Include ./bin/hello_world

  # mock date command to compare log lines
  date() { echo "2024-12-10 08:31:11"; }

  Describe 'validate'
    Context '<name> is undefined'
      It 'fails'
        expected_output() { %text
          #|
          #|says hello
          #|
          #|usage: bash <name>
          #|
          #|  <name>	A name to say hello to.
          #|
          #|the following environment variables should be present:
          #|
          #|  none
        }
        expected_stderr() { %text
          #|2024-12-10 08:31:11 [ERROR] [bash] The value for '<name>' cannot be empty
        }

        When run validate
        The output should eq "$(expected_output)"
        The stderr should eq "$(expected_stderr)"
        The status should be failure
      End 
    End

    Context '<name> is defined'
      It 'succeeds'
        When run validate "Lily"
        The status should be success
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
