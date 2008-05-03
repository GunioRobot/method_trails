require 'test/unit'
require 'require_relative'
require_relative '/../../helpers/rule_helper'
require_relative '/../../helpers/child_cstra_rstrb_rstrc_rstrd'

class TestChildWith2Children_CapStrA_RegStrB_RegStrC_RegStrD < Test::Unit::TestCase
  include RuleHelper
  def setup
    @rule = new_rule(
    [ :__child,
      [
        [ :__child,
          [ "%a",
            "b"
          ]
        ],
        [ :__child,
          [ "c",
            "d"
          ]
        ]
      ]
    ]
    )
  end
  include ShouldBehaveLikeChild_CapStrA_RegStrB_RegStrC_RegStrD
end
