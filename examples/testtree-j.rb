#!/usr/bin/env ruby

require "newt"

Newt::Screen.new

checktree = Newt::CheckboxTreeMulti.new(-1, -1, 10, " ab", Newt::FLAG_SCROLL)
checktree.add("�ʥ�С�", 2, 0, Newt::ARG_APPEND)
checktree.add("������������Ĺ�����", 3, 0, Newt::ARG_APPEND)
checktree.add("�ʥ�С���", 5, Newt::FLAG_SELECTED, Newt::ARG_APPEND)
checktree.add("�ʥ�С���", 6, 0, Newt::ARG_APPEND)
checktree.add("�ʥ�С���", 7, Newt::FLAG_SELECTED, Newt::ARG_APPEND)
checktree.add("�ʥ�С���", 8, 0, Newt::ARG_APPEND)
checktree.add("�ʥ�С���", 9, 0, Newt::ARG_APPEND)
checktree.add("�ʥ�С�����", 10, Newt::FLAG_SELECTED, Newt::ARG_APPEND)
checktree.add("�ʥ�С�����", 11, 0, Newt::ARG_APPEND)
checktree.add("�ʥ�С�����", 12, Newt::FLAG_SELECTED, Newt::ARG_APPEND)

checktree.add("���顼", 1, 0, 0)
checktree.add("�ֿ�", 100, 0, 0, Newt::ARG_APPEND)
checktree.add("��", 101, 0, 0, Newt::ARG_APPEND)
checktree.add("�Ŀ�", 102, 0, 0, Newt::ARG_APPEND)

checktree.add("�ʥ�С���", 4, 0, 3)

checktree.add("���ο���", 200, 0, 1, Newt::ARG_APPEND)
checktree.add("��", 201, 0, 1, 0, Newt::ARG_APPEND)
checktree.add("��", 202, 0, 1, 0, Newt::ARG_APPEND)
checktree.add("��", 203, 0, 1, 0, Newt::ARG_APPEND)
checktree.add("��", 204, 0, 1, 0, Newt::ARG_APPEND)

checktree.add("���ο���", 300, 0, 1, Newt::ARG_APPEND)
checktree.add("��", 210, 0, 1, 1, Newt::ARG_APPEND)
checktree.add("����", 211, 0, 1, 1, Newt::ARG_APPEND)
checktree.add("����", 212, 0, 1, 1, Newt::ARG_APPEND)
checktree.add("����", 213, 0, 1, 1, Newt::ARG_APPEND)

button = Newt::Button.new(-1, -1, "��λ")

grid = Newt::Grid.new(1, 2)
grid.set_field(0, 0, Newt::GRID_COMPONENT, checktree, 0, 0, 0, 1,
			  Newt::ANCHOR_RIGHT, 0)
grid.set_field(0, 1, Newt::GRID_COMPONENT, button, 0, 0, 0, 0,
			  0, 0)

grid.wrapped_window("�����å��ܥå����ĥ꡼�ƥ���")

form = Newt::Form.new
form.add(checktree, button)

answer = form.run()

Newt::Screen.finish

