package com.huhy.springboot_easyui.easyui.model.dao;


import com.huhy.springboot_easyui.easyui.common.AttachmentType;
import com.huhy.springboot_easyui.easyui.model.domain.Attachment;
import com.huhy.springboot_easyui.easyui.model.domain.Member;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AttachmentDao extends PagingAndSortingRepository<Attachment, Long> {
    Attachment findByFilePath(String filePath);

    List<Attachment> findByFilePathIsNotAndMemberAndType(String filePath, Member member, AttachmentType type);

}
