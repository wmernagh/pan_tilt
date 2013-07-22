module PanTilt
  class Rotor
    attr_reader :board, :tilt_servo, :pan_servo

    def initialize(board, debug=false)
      @debug      = debug

      @board      = board
      @tilt_servo = Dino::Components::Servo.new(pin: PanTilt::TILT_PIN,  board: @board)
      @pan_servo  = Dino::Components::Servo.new(pin: PanTilt::PAN_PIN, board: @board)
    end

    def rotate(pan_angle, tilt_angle)
      pan_servo.position = pan_angle
      tilt_servo.position = tilt_angle

      print_debug "p: #{pan_angle}, t: #{tilt_angle}"
    end

    private

    def print_debug(string)
      puts string if @debug
    end
  end
end
