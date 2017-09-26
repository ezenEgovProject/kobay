package kobay.com.cmmn;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kobay.com.service.MemberVO;

public class MemberVaildator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		MemberVO member = (MemberVO) obj;
		
		//기본 체크
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "required","필수입력 사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_pwd", "required","필수입력 사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "required","필수입력 사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_phone", "required","필수입력 사항입니다.");
		
		//아이디 체크
		String mId = member.getMember_id();
		boolean check = Pattern.matches("^[a-zA-Z0-9]+@[a-z]+\\.[a-z]+$", mId);
		if(!check) {
			errors.rejectValue("member_id","유효한 이메일이 아닙니다.");
			System.out.println("이메일 정규식 에러");
		}
		
		//비밀번호 체크
		String mPwd = member.getMember_pwd();
		check = Pattern.matches("^[a-zA-Z0-9]*$", mPwd);
		if(!check) {
			errors.rejectValue("member_pwd","유효한 비밀번호가 아닙니다.");
			System.out.println("비밀번호 정규식 에러");
		}
		
		//이름 체크(한글 안됨)
		String mName = member.getMember_name();
		boolean check1 = Pattern.matches("^[a-zA-Z]*$", mName);
		boolean check2 = Pattern.matches("^[가-힣]*$", mName);
		if(!check1 && !check2) {
			errors.rejectValue("member_name", "유효한 이름이 아닙니다.");
			System.out.println("이름 정규식 에러");
			System.out.println(mName);
		}
		
		//핸드폰 번호 체크
		String mPhone = member.getMember_phone();
		check = Pattern.matches("^01[0-9][0-9]{3,4}[0-9]{4}$", mPhone);
		if(!check) {
			errors.rejectValue("member_phone", "유효한 핸드폰 번호가 아닙니다.");
			System.out.println("핸드폰 번호 정규식 에러");
		}
	}

}
