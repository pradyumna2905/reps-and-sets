class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise, except: [:index, :new, :create]

    def index
        @exercises = current_user.exercises.all
    end

    def show

    end

    def destroy
        @exercise.destroy
        flash[:danger] = "Exercise has been deleted"
        redirect_to user_exercises_path(current_user)
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

    def edit

    end

    def update
        if @exercise.update(exercise_params)
            flash[:success] = "Exercise has successfully been edited"
            redirect_to [current_user, @exercise]
        else
            flash[:danger] = "Oops! The exercise did not update"
            render :edit
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
