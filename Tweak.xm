@interface TimePickerView
-(NSDate*)date;
@end
%hook AlarmController
-(void)updateAlarmWindowText{
    %orig;
    int hours = round([ [MSHookIvar<TimePickerView*>(self, "timePickerView") date] timeIntervalSinceNow] / 3600) +24;
    UILabel* label = MSHookIvar<UILabel*>(self, "alarmWindow");
    [label setText: [NSString stringWithFormat:@"%@ (%d %@)", label.text, hours, hours > 1 ? @"Hrs" : @"Hr"]];
}
%end

