class Admin::PoliciesController < ApplicationController

  def new
    @venue = Venue.find_by_id(params["venue_id"])
    @policy = Policy.new
  end

  def create
    puts "*****"
    puts params.inspect
    @policy = Policy.create(policy_params)
    if @policy.valid?
      # ONLY AFTER policy created (and venue exists) update the parse back end
      redirect_to root_path, notice: "Awesome, you're all done. Your venue us ready to start using Reservouz. Click the control panel to begin."
    else
      venue_id = params["policy"]["venue_id"]
      redirect_to new_admin_policy_path(:venue_id => venue_id), alert: "There was a problem, unable to save data. Please ensure all fields are completed"
    end
  end
  
  private

  def policy_params
    monday = Policy.build_time_array(params["policy"]["monday_start_a"], params["policy"]["monday_end_a"], params["policy"]["monday_start_b"], params["policy"]["monday_end_b"], params["policy"]["monday_start_c"], params["policy"]["monday_end_c"])
    tuesday = Policy.build_time_array(params["policy"]["tuesday_start_a"], params["policy"]["tuesday_end_a"], params["policy"]["tuesday_start_b"], params["policy"]["tuesday_end_b"], params["policy"]["tuesday_start_c"], params["policy"]["tuesday_end_c"])
    wednesday = Policy.build_time_array(params["policy"]["wednesday_start_a"], params["policy"]["wednesday_end_a"], params["policy"]["wednesday_start_b"], params["policy"]["wednesday_end_b"], params["policy"]["wednesday_start_c"], params["policy"]["wednesday_end_c"])
    thursday = Policy.build_time_array(params["policy"]["thursday_start_a"], params["policy"]["thursday_end_a"], params["policy"]["thursday_start_b"], params["policy"]["thursday_end_b"], params["policy"]["thursday_start_c"], params["policy"]["thursday_end_c"])
    friday = Policy.build_time_array(params["policy"]["friday_start_a"], params["policy"]["friday_end_a"], params["policy"]["friday_start_b"], params["policy"]["friday_end_b"], params["policy"]["friday_start_c"], params["policy"]["friday_end_c"])
    saturday = Policy.build_time_array(params["policy"]["saturday_start_a"], params["policy"]["saturday_end_a"], params["policy"]["saturday_start_b"], params["policy"]["saturday_end_b"], params["policy"]["saturday_start_c"], params["policy"]["saturday_end_c"])
    sunday = Policy.build_time_array(params["policy"]["sunday_start_a"], params["policy"]["sunday_end_a"], params["policy"]["sunday_start_b"], params["policy"]["sunday_end_b"], params["policy"]["sunday_start_c"], params["policy"]["sunday_end_c"])
    defaults = { monday: monday, tuesday: tuesday, wednesday: wednesday, thursday: thursday, friday: friday, saturday: saturday, sunday: sunday  }
    params.require(:policy).permit(:venue_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :concurrent_bookings, :duration_allowed).reverse_merge(defaults)
  end

end
