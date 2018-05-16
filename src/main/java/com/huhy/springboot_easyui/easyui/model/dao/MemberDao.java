package com.huhy.springboot_easyui.easyui.model.dao;

import com.huhy.springboot_easyui.easyui.model.domain.Member;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao extends PagingAndSortingRepository<Member, Long>, JpaSpecificationExecutor {

    int countByUserName(String userName);

    Member findByUserName(String userName);
}
