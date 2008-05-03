require 'require_relative'
require_relative '/ruby_graph/file_handling'
require_relative '/ruby_graph/introspect'
require_relative '/ruby_graph/method_calls'
require_relative '/ruby_graph/parser'

class RubyGraph

  attr_accessor :input_filename
  attr_accessor :dot_filename
  attr_accessor :s_exp_filename
  
  # Reads Ruby file from +input_filename+.  Parses and processes the file.
  # Saves results to +dot_filename+ in GraphViz format.
  def process
    klasses           = get_class_names
    _methods          = get_methods(klasses)
    _instance_methods = get_instance_methods(klasses)
    input_text        = read_input_file
    s_exp             = parse_to_s_expression(input_text)
    write_s_exp_file(s_exp)
    dot_data          = get_method_calls(s_exp)
    write_dot_file(dot_data)
  end
  
  protected
  
  include FileHandling
  include Introspect
  include MethodCalls
  include Parser

end