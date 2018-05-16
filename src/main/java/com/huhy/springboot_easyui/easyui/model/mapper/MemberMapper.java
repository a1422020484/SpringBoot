package com.huhy.springboot_easyui.easyui.model.mapper;

import java.util.List;

import com.huhy.springboot_easyui.easyui.model.domain.Member;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {

	public List<Member> findAll();
}
