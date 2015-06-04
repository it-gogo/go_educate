package com.go.common.enums;

/**
 * 一天24个小时,以半个小时划分节点
 * @author linyb
 * @create_time 2015年6月4日下午3:35:20
 */
public enum DatePoint {
	
	POINT1(1,"00:00:00","00:30:00","0_0.5"),POINT2(2,"00:30:00","01:00:00","0.5_1"),
	POINT3(3,"01:00:00","01:30:00","1_1.5"),POINT4(4,"01:30:00","02:00:00","1.5_2"),
	POINT5(5,"02:00:00","02:30:00","2_2.5"),POINT6(6,"02:30:00","03:00:00","2.5_3"),
	POINT7(7,"03:00:00","03:30:00","3_3.5"),POINT8(8,"03:30:00","04:00:00","3.5_4"),
	POINT9(9,"04:00:00","04:30:00","4_4.5"),POINT10(10,"04:30:00","05:00:00","4.5_5"),
	POINT11(11,"05:00:00","05:30:00","5_5.5"),POINT12(12,"05:30:00","06:00:00","5.5_6"),
	POINT13(13,"06:00:00","06:30:00","6_6.5"),POINT14(14,"06:30:00","07:00:00","6.5_7"),
	POINT15(15,"07:00:00","07:30:00","7_7.5"),POINT16(16,"07:30:00","08:00:00","7.5_8"),
	POINT17(17,"08:00:00","08:30:00","8_8.5"),POINT18(18,"08:30:00","09:00:00","8.5_9"),
	POINT19(19,"09:00:00","09:30:00","9_9.5"),POINT20(20,"09:30:00","10:00:00","9.5_10"),
	POINT21(21,"10:00:00","10:30:00","10_10.5"),POINT22(22,"10:30:00","11:00:00","10.5_11"),
	POINT23(23,"11:00:00","11:30:00","11_11.5"),POINT24(24,"11:30:00","12:00:00","11.5_12"),
	POINT25(25,"12:00:00","12:30:00","12_12.5"),POINT26(26,"12:30:00","13:00:00","12.5_13"),
	POINT27(27,"13:00:00","13:30:00","13_13.5"),POINT28(28,"13:30:00","14:00:00","13.5_14"),
	POINT29(29,"14:00:00","14:30:00","14_14.5"),POINT30(30,"14:30:00","15:00:00","14.5_15"),
	POINT31(31,"15:00:00","15:30:00","15_15.5"),POINT32(32,"15:30:00","16:00:00","15.5_16"),
	POINT33(33,"16:00:00","16:30:00","16_16.5"),POINT34(34,"16:30:00","17:00:00","16.5_17"),
	POINT35(35,"17:00:00","17:30:00","17_17.5"),POINT36(36,"17:30:00","18:00:00","17.5_18"),
	POINT37(37,"18:00:00","18:30:00","18_18.5"),POINT38(38,"18:30:00","19:00:00","18.5_19"),
	POINT39(39,"19:00:00","19:30:00","19_19.5"),POINT40(40,"19:30:00","20:00:00","19.5_20"),
	POINT41(41,"20:00:00","20:30:00","20_20.5"),POINT42(42,"20:30:00","21:00:00","20.5_21"),
	POINT43(43,"21:00:00","21:30:00","21_21.5"),POINT44(44,"21:30:00","22:00:00","21.5_22"),
	POINT45(45,"22:00:00","22:30:00","22_22.5"),POINT46(46,"22:30:00","23:00:00","22.5_23"),
	POINT47(47,"23:00:00","23:30:00","23_23.5"),POINT48(48,"23:30:00","24:00:00","23.5_24");
	
	private int index; //下标
	private String start; //开始时间
	private String end; //结束时间
	private String desc; //描述 几点到几点的
	private DatePoint(int index, String start, String end,String desc) {
		this.index = index;
		this.start = start;
		this.end = end;
		this.desc = desc;
	}
	/**
	 * 根据index下表获取对应时间节点
	 * @author linyb
	 * @create_time 2015年6月4日下午4:05:26
	 * @param index
	 * @return
	 */
	public static DatePoint getByIndex(int index){
		for (DatePoint point : DatePoint.values()) {
			if(point.getIndex() == index){
				return point;
			}
		}
		return null;
	}
	/**
	 * 根据描述获取对应的时间节点
	 * @author linyb
	 * @create_time 2015年6月4日下午4:06:59
	 * @param desc
	 * @return
	 */
	public static DatePoint getByDesc(String desc){
		for (DatePoint point : DatePoint.values()) {
			if(point.getDesc().equals(desc)){
				return point;
			}
		}
		return null;
	}
	/**
	 * 根据开始时间 和结束时间字符串 获取对应的时间节点
	 * @author linyb
	 * @create_time 2015年6月4日下午4:09:25
	 * @param start
	 * @param end
	 * @return
	 */
	public static DatePoint getByStartAndEnd(String start,String end){
		for (DatePoint point : DatePoint.values()) {
			if(point.getStart().equals(start) && point.getEnd().equals(end)){
				return point;
			}
		}
		return null;
	}
	
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

	public static void main(String[] args) {
		DatePoint point = getByDesc("2_2.5");
		System.out.println(point.getStart()+"--"+point.getEnd());
	}
}
