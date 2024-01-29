class AttendancesController < ApplicationController
  
  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    #出勤時間が未登録であることを判定します。
    if @attendance.started_at.nil?
     if @attendance.update(started_at: Time.current.change(set: 0))
       flash[:info] = "おはようございます！"
     else
       flash[:danger] = "勤怠登録に失敗しました。やり直してください。"
     end
    end
  redirect_to @user
  end 
end
