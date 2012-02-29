#!/usr/bin/env ruby

require "newt"

menuContents = ["��", "��", "��", "��", "��"]
autoEntries = ["����ȥ�", "�̤Υ���ȥ�", 
  "�����ܤΥ���ȥ�", "�����ܤΥ���ȥ�",]

begin
  Newt::Screen.new

  b1 = Newt::Checkbox.new(-1, -1, "�ƥ��ȤΤ���Τ��ʤ�Ĺ�������å��ܥå���", ' ', nil)
  b2 = Newt::Button.new(-1, -1, "�̤Υܥ���")
  b3 = Newt::Button.new(-1, -1, "��������������")
  b4 = Newt::Button.new(-1, -1, "��������������")

  f = Newt::Form.new

  grid = Newt::Grid.new(2, 2)
  grid.set_field(0, 0, Newt::GRID_COMPONENT, b1, 0, 0, 0, 0,
				Newt::ANCHOR_RIGHT, 0)
  grid.set_field(0, 1, Newt::GRID_COMPONENT, b2, 0, 0, 0, 0, 0, 0)
  grid.set_field(1, 0, Newt::GRID_COMPONENT, b3, 0, 0, 0, 0, 0, 0)
  grid.set_field(1, 1, Newt::GRID_COMPONENT, b4, 0, 0, 0, 0, 0, 0)

  f.add(b1, b2, b3, b4)

  grid.wrapped_window("�����ܤΥ�����ɥ�")

  answer = f.run()

  #f.destroy()
  Newt::Screen.pop_window()

  flowedText, textWidth, textHeight = Newt.reflow_text("����Ϥ��ʤ�ƥ����Ȥ餷����ΤǤ���40�����" +
													 "��Ĺ���ǡ���åԥ󥰤��Ԥ��ޤ���" +
													 "���ᤤ���㿧�θѤ��Τ�ޤʸ�������" +
													 "�ۤ����Τ��ΤäƤ뤫��?\n\n" +
													 "¾�ˤ��Τ餻���뤳�ȤȤ��ơ�Ŭ���˲��Ԥ򤹤�" +
													 "���Ȥ����פǤ���",
													 40, 5, 5)
  t = Newt::Textbox.new(-1, -1, textWidth, textHeight, Newt::FLAG_WRAP)
  t.set_text(flowedText)

  b1 = Newt::Button.new(-1, -1, "λ��")
  b2 = Newt::Button.new(-1, -1, "����󥻥�")

  grid = Newt::Grid.new(1, 2)
  subgrid = Newt::Grid.new(2, 1)

  subgrid.set_field(0, 0, Newt::GRID_COMPONENT, b1, 0, 0, 0, 0, 0, 0)
  subgrid.set_field(1, 0, Newt::GRID_COMPONENT, b2, 0, 0, 0, 0, 0, 0)

  grid.set_field(0, 0, Newt::GRID_COMPONENT, t, 0, 0, 0, 1, 0, 0)
  grid.set_field(0, 1, Newt::GRID_SUBGRID, subgrid, 0, 0, 0, 0, 0,
				Newt::GRID_FLAG_GROWX)
  grid.wrapped_window("�̤���")

  f = Newt::Form.new
  f.add(b1, t, b2)
  #f.add(b1, b2)
  answer = f.run()

  Newt::Screen.pop_window()
  #f.destroy()

  Newt::Screen.win_message("����ץ�", "λ��", "����ϥ���ץ�ʥ�å�����������ɥ��Ǥ�")
  Newt::Screen.win_choice("����ץ�", "λ��", "����󥻥�", "����ϥ���ץ�����򥦥���ɥ��Ǥ�")

  textWidth = Newt::Screen.win_menu("�ƥ��ȥ�˥塼", "����� newtWinMenu() ������Υ���ץ�" +
									"�Ǥ��� ��������С���ɬ�פ˱����ƤĤ����ꡢ " +
									"�Ĥ��ʤ��ä��ꤷ�ޤ���", 50, 5, 5, 3,
									menuContents, "λ��", "����󥻥�")

  v = Newt::Screen.win_entries("�ƥ����� newtWinEntries()", "����� newtWinEntries()" +
							   "������Υ���ץ�Ǥ��������ؤ��ñ�ˤ�����������Ϥ�" +
							   "�������Ȥ��Ǥ��ޤ���", 50, 5, 5, 20, autoEntries, "λ��", "����󥻥�")

ensure
  Newt::Screen.finish

  printf "item = %d\n", textWidth
  p v
end
