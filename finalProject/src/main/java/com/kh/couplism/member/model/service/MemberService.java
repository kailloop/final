<<<<<<< HEAD
package com.kh.couplism.member.model.service;

=======
package com.kh.couplism.member.model.service;

>>>>>>> branch 'JH' of https://github.com/kailloop/final.git
import java.util.Map;
import com.kh.couplism.member.model.vo.Member;

public interface MemberService {
	
	int enrollMember(Member m);
	
	int duplicateId(String id);
	
	Member selectOneMember(Map param);
}
