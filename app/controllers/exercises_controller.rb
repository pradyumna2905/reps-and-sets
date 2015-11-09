class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise, except: [:index, :new, :create]

    def index
        @exercises = current_user.exercises.all
    end

    def show

    end

    def new
       @exercise = current_user.exercises.new
    end

    def create
        @exercise = current_user.exercises.new(exercise_params)

        if @exercise.save
            flash[:success] = "Hooray! Your exercise has successfully been added to your lounge"
            redirect_to [current_user, @exercise]
        else
            flash[:danger] = "Oops! Something went wrong"
            render :new
        end
    end

        private
            def exercise_params
               params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
            end

            def set_exercise
                @exercise = current_user.exercises.find(params[:id])
            end
end
