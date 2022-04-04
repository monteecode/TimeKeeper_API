class UserTimesController < ApplicationController
    def create

        user = User.find_by(id: params[:user_id])
        if user
           
            if (user.isDateDuplicated?(params[:date_of_times]))
                if (params[:clock_in] < params[:clock_out] || params[:clock_in] != "" || params[:clock_out] != "")
                    date = "#{params[:date_of_times]}"
                    clock_in = "#{params[:clock_in]} #{date}" #constructing dateTime
                    clock_out = "#{params[:clock_out]} #{date}" #constructing dateTime
                    times = user.user_times.create(clock_in: clock_in, clock_out: clock_out, date_of_times: params[:date_of_times])
                    render json: user, include: :user_times
                   
                else
                    render json: {err_message: "You entered invalid times."}
                end
            else
                render json: {err_message: "A time stamp already exist for this date.  Please update instead."}
            end
        else 
            render json: {err_message: "A user is not logged in."}
        end
     
  
    end
 
end